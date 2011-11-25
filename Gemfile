source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'sqlite3'
gem 'jquery-rails'
gem 'devise', '>= 1.4.9'
gem 'haml'
gem 'therubyracer'
gem "paperclip", "~> 2.4"
gem 'twitter-bootstrap-rails'
gem 'inherited_resources'

group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass', '~> 0.12.alpha.0'
  gem 'html5-boilerplate', :group => :production, :git => 'git://github.com/sporkd/compass-html5-boilerplate.git'
end

group :development do
  gem 'mongrel', '1.2.0.pre2'
  gem 'haml-rails', '>= 0.3.4'
  gem "rspec-rails", ">= 2.7.0"
  gem "ruby-debug19"

  ## Guard
  gem 'guard'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'guard-rspec'
  gem 'guard-spork'
end

group :test do
  gem 'rspec-rails', '>= 2.7.0'
  gem 'factory_girl_rails', '>= 1.3.0'
  gem 'capybara', '>= 1.1.1'
  gem 'database_cleaner', '>= 0.6.7'
  gem 'launchy', '>= 2.0.5'
  gem 'shoulda'
  gem 'email_spec'
end
