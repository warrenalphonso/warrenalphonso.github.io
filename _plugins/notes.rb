module Jekyll
    # Liquid tag for inserting notes in reading page
    class NotesTag < Liquid::Tag 
        def initialize(tag_name, bare_file_name, tokens)
            super
            @bare_file_name = bare_file_name.strip #.strip removes all leading and trailing whitespace
            @md_file_name = "#{@bare_file_name}.md"
            @html_file_name = "#{@bare_file_name}.html"
        end 

        # Parses liquid - here, used to call {% include %} tag in this tag
        def liquid_parse(input)
            Liquid::Template.parse(input).render(@context)
        end

        # Parses Markdown note to HTML because Jekyll parses markdown last so when inserting markdown notes
        # they have Markdown formatting and never get converted to HTML
        def build_html()
            `python -m markdown ./_notes/#{@md_file_name} > ./_includes/html_notes/#{@html_file_name}`
        end

        # Uses includes tag to get HTML file then returns proper HTML for expand/collapse effect in reading
        def build_full()
            tag = "{% include /html_notes/#{@html_file_name} %}"
            contents = liquid_parse(tag)
            "<a class='collapsible'></a><div class='note-content'>#{contents}</div>"
        end
        
        def render(context)
            @context = context
            build_html()
            build_full()
        end 
    end
end

Liquid::Template.register_tag('notes', Jekyll::NotesTag)
