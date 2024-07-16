module CharactersHelper
  def sorted_skills(character)
    character.skills.order(:casting_time)
  end
end
