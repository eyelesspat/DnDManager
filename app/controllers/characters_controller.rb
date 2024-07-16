class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    @skills = @character.skills.order(:casting_time)
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])

    if @character.update(character_params)
      redirect_to @character
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def character_params
    params.require(:character).permit(:name, :description)
  end
end
