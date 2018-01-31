class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = User.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html
      format.json  { render :json => @movies }
    end
  end

  def show
    @movie = Movie.new(movie_params)
    respond_to do |format|
      format.html
      format.json  { render :json => @movie }
    end
  end

  def edit
    @movie = Movie.new(movie_params)
  end

  def update
    @movie = User.find(params[:id])
    if @movie.update(user_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end
  
  def destroy
    @movie = Movie.new(movie_params)
    @movie.destroy
    redirect_to root_path
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :description, :rating, :release_date)
  end
end
