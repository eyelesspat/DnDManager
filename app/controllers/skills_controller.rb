class SkillsController < ApplicationController
  before_action :set_character

  def new
    @skill = @character.skills.build
  end

  def create
    @skill = @character.skills.build(skill_params)
    return unless @skill.save

    redirect_to @character, notice: 'Skill was successfully created.' # Redirect to show page of @character # Render the new template again if there are errors
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    redirect_to character_path(params[:character_id])
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def skill_params
    params.require(:skill).permit(:name, :casting_time, :range, :duration, :description)
  end
end
