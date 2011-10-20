require 'sinatra/base'
require 'haml'

class Base < Sinatra::Base
  set :views => lambda {"views/#{self.name.split(/Controller/).first.downcase}"}
  set :haml, :layout => :'/../layout', :format => :html5, :escape_html => true
  before do
    content_type :html, :charset => 'utf-8'
    set :haml, :layout => false if request['X-PJAX']
  end
end
