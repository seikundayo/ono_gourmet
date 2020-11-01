class DropTableGenre < ActiveRecord::Migration[6.0]
  def change
    drop_table :topic_genres
  end
end
