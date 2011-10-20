require './lib/base'

class Home < Base
  get '/' do
    haml :index
  end
end
