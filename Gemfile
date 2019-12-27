# frozen_string_literal: true

source "https://rubygems.org"
#ruby RUBY_VERSION

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

#jekyll: "jekyll serve --drafts"

# We'll need rake to build our site in TravisCI
gem "rake", "~> 12"
gem 'jekyll'
gem "minima"

# gem "rails"
# gem "jekyll"
# gem "minima"

# gem "github-pages", group: :jekyll_plugins

group :jekyll_plugins do
    gem "jekyll-toc"
    gem "jekyll-youtube"
    gem "jekyll-last-modified-at"
end
