class AddUserIdToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :user_id, :integer
  end
end
