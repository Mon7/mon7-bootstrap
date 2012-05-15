source :rubygems

gem 'rack'
gem 'rake'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'haml'
gem 'thin', :platforms => :ruby
gem 'trinidad', :platforms => :jruby
#gem 'mail'
#gem 'datamapper'
#gem 'dm-postgres-adapter'
#gem 'dm-sweatshop'
#gem 'randexp'
#gem 'resque'
#gem 'pdfkit'

group :development do
  gem 'guard'
  gem 'rb-inotify', :require => false #linux
  gem 'rb-fsevent', :require => false #mac
  gem 'growl', :require => false #mac
	gem 'guard-rspec'
	gem 'launchy'

  gem 'sprockets'
  gem 'sprockets-urlrewriter'
  gem 'uglifier', :platforms => :ruby
  gem 'therubyracer', :platforms => :ruby
  gem 'closure-compiler', :platforms => :jruby
  gem 'therubyrhino', :platforms => :jruby
  gem 'coffee-script'
end

group :test do
	gem 'rspec'
	gem 'capybara'
  gem 'cucumber'
end
