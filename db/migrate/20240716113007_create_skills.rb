class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :casting_time
      t.string :range
      t.string :duration
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
