class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    if params[:search]
      @actors = Actor.search(params[:search]).order("created_at DESC")
    else
      @actors = Actor.all.order('created_at DESC')
    end
    respond_to do |format|
      format.html
      format.json  { render :json => @movies }
    end
  end

  def show
    @movies = Movie.all
    @actor = Actor.find(params[:id])
  end

  def new
    @actor = Actor.new
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      redirect_to @actor
    else
      render 'new'
    end
  end

  def update
    @actor = Actor.find(params[:id])
    @movies = Movie.all
    if(params[:movie_id])
      @actor.movies << @movies.find_by(id: params[:movie_id])
      redirect_to @actor
    else
      if @actor.update(actor_params)
        redirect_to @actor
      else
        render 'edit'
      end
    end
  end

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    redirect_to actors_path
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :date_of_birth, :description)
  end
end
