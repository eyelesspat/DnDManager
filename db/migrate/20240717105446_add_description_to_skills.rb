class AddDescriptionToSkills < ActiveRecord::Migration[7.1]
  def change
    add_column :skills, :description, :string
  end
end
