class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name, index: true
      t.integer :marvel_story_id, index: true
      t.string :character_description, index: true
      t.integer :character_real_id, index: true

      t.timestamps
    end
  end
end
