source :rubygems

gem 'rack'
gem 'rake'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'
gem 'haml'
gem 'sprockets'
gem 'sprockets-urlrewriter'
gem 'coffee-script'

platforms :jruby do
  gem 'trinidad'
  gem 'closure-compiler'
  gem 'therubyrhino'
end

platforms :ruby do
  gem 'thin'
  gem 'uglifier'
  gem 'therubyracer'
end

group :development do
  gem 'guard'
  gem 'rb-inotify', :require => false #linux
  gem 'rb-fsevent', :require => false #mac
  gem 'growl', :require => false #mac
  gem 'guard-rspec'
  gem 'launchy'
  gem 'foreman'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end
