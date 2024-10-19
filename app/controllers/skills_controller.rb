class SkillsController < ApplicationController
  before_action :set_character

  def new
    @skill = @character.skills.build
  end

  def show
    @skill = Skill.find_by(id: params[:id])
    return unless @skill.nil?

    redirect_to root_path, alert: 'Skill not found'
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def create
    @skill = @character.skills.build(skill_params)

    if @skill.save
      redirect_to @character, notice: 'Skill was successfully created.'
    else
      render :new
    end
  end

  def update
    @skill = Skill.find(params[:id])

    if @skill.update(skill_params)
      redirect_to character_skill_path(@character, @skill), notice: 'Skill was successfully updated.'
    else
      render :edit
    end
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
    params.require(:skill).permit(:name, :casting_time, :range, :target, :components, :duration, :description)
  end
end
