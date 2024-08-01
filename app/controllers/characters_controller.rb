class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    @action_skills = @character.skills.where(casting_time: 'action')
    @bonus_action_skills = @character.skills.where(casting_time: 'bonus action')
    @reaction_skills = @character.skills.where(casting_time: 'reaction')
    @items = @character.items
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

  def edit_stats
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

  def update_stats
    if @character.update(character_stats_params)
      redirect_to @character, notice: 'Character stats were successfully updated.'
    else
      render :edit_stats, status: :unprocessable_entity
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    redirect_to root_path, status: :see_other
  end

  def items
    @character = Character.find(params[:id])
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :image, :current_hitpoints,
                                      :total_hitpoints, :current_resource, :total_resource)
  end

  def character_stats_params
    params.require(:character).permit(:current_hitpoints, :total_hitpoints, :current_resource, :total_resource)
  end
end
