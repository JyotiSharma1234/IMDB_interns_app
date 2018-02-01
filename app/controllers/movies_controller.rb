class MoviesController < ApplicationController
  def new
    @movie = Movie.new
    Movie.search(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @movies = Movie.all
    if params[:search]
      @movies = Movie.search(params[:search]).order("created_at DESC")
    else
      @movies = Movie.all.order('created_at DESC')
    end
    respond_to do |format|
      format.html
      format.json  { render :json => @movies }
    end
  end

  def show
    @movie = Movie.find(params[:id])
    respond_to do |format|
      format.html
      format.json  { render :json => @movie }
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :description, :rating, :release_date)
  end
end
