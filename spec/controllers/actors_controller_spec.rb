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
      post :create, params: {actor: {name: 'ajay', date_of_birth: '1-1-2010', description: 'very talented actor'}}, format: :json
    end
    it 'renders html' do
       expect(response.content_type).to eq('text/html')
     end
     it 'returns 302 status' do
        expect(response.status).to eq(302)
      end
  end

  describe 'GET #show'
  it 'returns 200 status' do
    get :show, params: { id: 1 }
    expect(response.status).to eq(200)
  end

  describe "PATCH #update" do
   context "with valid data" do
     it "updates the actor and redirects" do
       patch :update, params: { id: @actor.id , actor: { name: "xyz", date_of_birth: '1-1-2010', description: 'hveurbvebvu'}}
       expect(response).to be_redirect
     end
   end
   context "with invalid data" do
     it "does not change the actor, and re-renders the form" do
       patch :update, params: { id: @actor.id, actor: { name: "xyz", date_of_birth: '1-1-2010', description: 'h'}}
       expect(response).not_to be_redirect
     end
   end
  end

  describe "DELETE #destroy" do
    before(:each) do
      delete :destroy, params: { id: 1 }
    end
    it 'returns 302 reponse code' do
      expect(response.status).to eq(302)
    end
    it 'returns nil for deleted object' do
      @actor = Actor.find_by(id: 1)
      expect(@actor).to be_falsey
    end
  end
end
