ENV['RACK_ENV'] = 'test'
require './config/environment'
require 'rspec'
require 'capybara/rspec'
require 'capybara-webkit'
require 'rack'
require 'rack/test'

RSpec.configure do |config|
  config.expect_with :rspec, :stdlib 
  config.filter_run_excluding :skip => true
  config.include Rack::Test::Methods
  def app
    eval "Rack::Builder.new {#{File.read('./config.ru')}}"
  end
end
Capybara.javascript_driver = :webkit #:selenium :webkit_debug
Capybara.app = eval "Rack::Builder.new {#{File.read('./config.ru')}}"
