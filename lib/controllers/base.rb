# encoding: utf-8

require 'sinatra/base'
require 'sinatra/flash'
require 'haml'

class BaseController < Sinatra::Base
  set :views => lambda { "views/#{StringExtension.underscore(self.name[0..-11])}" }
  set :haml, :layout => :'/../layout', :format => :html5, :escape_html => true

  register Sinatra::Flash

  before do
    content_type :html, :charset => 'utf-8'
    set :haml, :layout => false if request['X-PJAX']
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end
end
