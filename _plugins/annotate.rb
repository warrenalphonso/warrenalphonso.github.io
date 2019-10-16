module Jekyll
    class AnnotateTag < Liquid::Tag 
        def initialize(tag_name, text, tokens) 
            super 
            @@i = 0
            @text = text 
        end 

        def render(context) 
            @@i = @@i + 1
            return ("[#{@@i}] <span class='writing-annotations'>[#{@@i}] #{@text}</span>")
        end 
    end 
end 

Liquid::Template.register_tag('annotate', Jekyll::AnnotateTag)