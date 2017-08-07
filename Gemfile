source 'https://rubygems.org'

ruby "~> 2.3.4"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Hirb enables better formatting for tables in console
  gem 'hirb'
  # gem 'better_errors'
  gem 'awesome_print'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'bullet'
  gem "slack-notifier"
end

# Use sqlite3 as the database for Active Record
group :development, :test do
  # Handle environmental variables
  gem 'dotenv-rails'
  gem 'sqlite3'
end


group :production do
  gem 'pg'
  gem 'tunemygc'
  gem 'skylight'
  gem 'rails_12factor'
  gem 'puma'
  gem 'dragonfly-s3_data_store'
  gem 'fog-aws'
end

gem 'sdoc', '~> 0.4.0', group: :doc


# generate thumbnails from linkedin data
gem 'link_thumbnailer'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Faker makes fake data (e.g. lorem ipsum)
gem 'faker'
gem 'betterlorem'
# Manage Linkedin OAuth2
gem "linkedin-oauth2", "~> 1.0"
# Cross Browser compatiblity gem
gem "autoprefixer-rails"

gem "rollbar"

# Refinery CMS -----------------------------------------------------------------
gem 'refinerycms', '~> 3.0'
# Optionally, specify additional Refinery CMS Extensions here:
gem 'refinerycms-acts-as-indexed', ['~> 2.0', '>= 2.0.1']
gem 'refinerycms-wymeditor', ['~> 1.0', '>= 1.0.6']
gem 'refinerycms-authentication-devise', '~> 1.0'
#  gem 'refinerycms-blog', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-inquiries', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-search', ['~> 3.0', '>= 3.0.0']
gem 'refinerycms-page-images', '~>3.0.0', github: "refinery/refinerycms-page-images", branch: "master"

gem 'refinerycms-projects', path: 'vendor/extensions'
gem 'refinerycms-team_members', path: 'vendor/extensions'
gem 'refinerycms-tags', path: 'vendor/extensions'
gem 'refinerycms-articles', path: 'vendor/extensions'
gem 'refinerycms-organization_tabs', path: 'vendor/extensions'
gem 'refinerycms-custom_pages', path: 'vendor/extensions'
