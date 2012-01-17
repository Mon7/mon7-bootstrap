#encoding: utf-8
require './spec/spec_helper'

describe HomeController, :type => :request do
  it 'renders Välkommen' do
    visit '/'
    page.should have_content 'Välkommen'
  end
end
