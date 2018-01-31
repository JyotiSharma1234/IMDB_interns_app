require 'rails_helper'
require 'pry'
RSpec.describe ActorsController do
  it '' do
    get :index
    expect(response.status).to eq(200)
    #binding.pry
    expect(response.content_type).to eq('text/html')
  end
end
