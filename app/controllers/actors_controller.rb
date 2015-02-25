class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def edit
    @actor = Actor.find params[:id]
  end

  def show
    @actor = Actor.find params[:id]
  end

  def create
    @actor = Actor.new actor_params
    if @actor.save
      redirect_to actor_path(@actor)
    else
      render :new
    end
  end

  def update
        @actor = Actor.update_attributes actor_params
    if @actor.save
      redirect_to actor_path(@actor)
    else
      render :edit
    end
  end


  def destroy
    actor = Actor.find params[:id]
    actor.destroy
    redirect_to actors_path
  end
  def actor_params
    params.require(:post).permit(:name)

  end
end
