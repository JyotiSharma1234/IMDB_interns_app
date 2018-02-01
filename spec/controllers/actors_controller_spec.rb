require 'rails_helper'
require 'pry'
RSpec.describe ActorsController do
  before(:each) do
    @actor = FactoryGirl.create(:actor)
  end

  describe 'GET #index' do
    before(:each) do
      get :index
    end
    it 'returns 200 status' do
      expect(response.status).to eq(200)
    end

    it 'renders html' do
      expect(response.content_type).to eq('text/html')
    end
  end

  describe 'POST #create' do
    before(:each) do
      post :create, params: {actor: {name: 'ajay', date_of_birth: '1-1-2010', description: 'hveurbvebvu'}}, format: :json
    end
    it 'renders html' do
       expect(response.content_type).to eq('text/html')
     end
     it 'returns 201 status' do
        expect(response.status).to eq(201)
      end
  end

  describe 'GET #show'
  it 'returns 200 status' do
    get :show, params: { id: 1 }
    expect(response.status).to eq(200)
  end

  describe "PATCH #update" do
   context "with good data" do
     it "updates the actor and redirects" do
       patch :update, params: { id: @actor.id , actor: { name: "xyz", date_of_birth: '1-1-2010', description: 'hveurbvebvu'}}
       expect(response).to be_redirect
     end
   end
   context "with bad data" do
     it "does not change the actor, and re-renders the form" do
       patch :update, params: { id: @actor.id, actor: { name: "xyz", date_of_birth: '1-1-2010', description: 'h'}}
       expect(response).not_to be_redirect
     end
   end
  end
end
