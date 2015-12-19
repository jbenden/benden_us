# If you have OpenSSL installed, we recommend updating
# the following line to use 'https'
source 'https://rubygems.org'
ruby '2.1.2'

gem 'middleman', '~> 3.3.7'

# Middleman's blog functionality
gem 'middleman-blog'
gem 'builder'
gem 'nokogiri'
gem 'sanitize'

# Live-reloading plugin
gem 'middleman-livereload', '~> 3.3.4'

# Autoprefixer plugin
gem 'middleman-autoprefixer', '~> 2.2.2'

# HTML minification
gem 'middleman-minify-html'

# Syntax-highlighting support
gem 'middleman-syntax'

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.0', :platforms => [:mswin, :mingw]

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem 'ruby18_source_location'
end

# Deployment-related plugins
gem 'dotenv'
gem 'rack-contrib'
gem 'rack-rewrite'
gem 'unicorn'
