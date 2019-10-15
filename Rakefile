task :default do
    puts "Running CI tasks..."

    # Runs the jekyll build command for production
    # TravisCI will now have a site directory with our
    # statically generated files.
    sh("JEKYLL_ENV=development bundle exec jekyll build")
    puts "Jekyll successfully built"
end