class CreateMarvelStories < ActiveRecord::Migration[6.1]
  def change
    create_table :marvel_stories do |t|
      t.string :description, index: true
      t.string :title, index: true
      t.text :attribution_text, index: true
      t.integer :real_id, index: true

      t.timestamps
    end
  end
end
