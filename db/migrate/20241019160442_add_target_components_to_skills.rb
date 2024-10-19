class AddTargetComponentsToSkills < ActiveRecord::Migration[7.1]
  def change
    add_column :skills, :target, :string
    add_column :skills, :components, :string
  end
end
