#encoding: utf-8
require 'bundler/setup'
Dir["./lib/*.rb"].each { |file| require file }
require './config/environment'

require 'sprockets'
require 'sprockets-urlrewriter'
require 'uglifier'
require 'coffee_script'
map '/assets' do
  s = Sprockets::Environment.new
  s.append_path 'assets/css'
  s.append_path 'assets/js'
  s.append_path 'vendor/assets'
  s.js_compressor = Uglifier.new if ENV['RACK_ENV'] == 'production'
  s.register_preprocessor 'text/css', Sprockets::UrlRewriter
  s.cache = Sprockets::Cache::FileStore.new("tmp/sprockets")
  run s
end

map '/' do
  use Rack::Static, {
    :root => "public",
    :urls => ["/images", "/fonts", "/favicon.ico", "/robots.txt"],
    :cache_control => "public,max-age=#{365 * 24 * 3600}"
  }
  use Rack::Session::Cookie, :secret => ENV['session_secret'] || 'A5QnDPLndHQRhFhudvfghQBc3iFgtuwZwo4xrR856hcYbd80Ow6T43G1Vr1VC0c6', :expire_after => 365 * 24 * 3600
  use Rack::MethodOverride

  map '/' do
    run Home
  end
end
