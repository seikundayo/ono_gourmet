class CreateTopicGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_genres do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
