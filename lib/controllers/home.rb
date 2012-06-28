# encoding: utf-8

require './lib/controllers/base'

class HomeController < BaseController
  get '/' do
    haml :index
  end
end
