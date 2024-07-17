class AddClassResourceToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :total_resource, :integer
    add_column :characters, :current_resource, :integer
  end
end
