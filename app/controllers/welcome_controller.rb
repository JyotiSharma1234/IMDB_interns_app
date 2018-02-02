class WelcomeController < ApplicationController
  def index
    @movie_results = Movie.search(params[:search_term])
    @actor_results = Actor.search(params[:search_term])
  end
end
