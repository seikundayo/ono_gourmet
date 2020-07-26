class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :genre
      t.text :content
      t.string :image
      t.timestamps
    end
  end
end
