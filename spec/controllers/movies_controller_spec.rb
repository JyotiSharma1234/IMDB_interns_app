require 'rails_helper'
require 'pry'

RSpec.describe MoviesController do
  before(:each) do
    @movie = FactoryGirl.create(:movie)
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
      post :create, params: {movie: { name: 'singham',  description: 'bollywood action movie',rating: '5', release_date: '1-1-2010' } }, format: :json
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
       patch :update, params: { id: @movie.id , movie: { name: 'welcome',  description: 'bollywood comedy movie',rating: '5', release_date: '1-1-2010' }}
       expect(response).to be_redirect
     end
   end
   context "with invalid data" do
     it "does not change the actor, and re-renders the form" do
       patch :update, params: { id: @movie.id, movie: { name: 'welcome',  description: 'hv',rating: '5', release_date: '1-1-2010' }}
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
      @movie = Movie.find_by(id: 1)
      expect(@movie).to be_falsey
    end
  end
end
