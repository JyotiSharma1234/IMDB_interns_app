require 'rails_helper'
require 'pry'
RSpec.describe ActorsController do
  it '' do
    get :index
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('text/html')
  end

  it '' do
     post :create, params: {actor: {name: 'ajay', date_of_birth: '1-1-2010', description: 'hveurbvebvu'}}, format: :json
     expect(response.content_type).to eq('text/html')
     #binding.pry
     expect(response.status).to eq(302)
     #binding.pry
   end
end
