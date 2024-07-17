class AddHpToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :total_hitpoints, :integer
    add_column :characters, :current_hitpoints, :integer
  end
end
