require 'bundler/setup'
require './config/environment'
require './lib/controllers'

if ENV['RACK_ENV'] == 'development'
  require 'sprockets'
  require 'sprockets-urlrewriter'
  require 'uglifier'
  require 'coffee_script'
  map '/assets' do
    s = Sprockets::Environment.new
    s.append_path 'assets/css'
    s.append_path 'assets/js'
    s.append_path 'vendor/assets'
    s.js_compressor = Uglifier.new
    s.register_preprocessor 'text/css', Sprockets::UrlRewriter
    s.cache = Sprockets::Cache::FileStore.new("tmp")
    run s
  end
end

map '/' do
  use Rack::Static, {
    :root => "public",
    :urls => ["/images", "/fonts", "/favicon.ico", "/robots.txt", "/assets"],
    :cache_control => "public,max-age=#{365 * 24 * 3600}"
  }
  use Rack::Session::Cookie, :secret => ENV['SESSION_SECRET'], :expire_after =>  24 * 3600
  use Rack::MethodOverride

  map '/' do
    run HomeController
  end
end
