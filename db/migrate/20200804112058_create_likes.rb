class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false, index: true
      t.integer :topic_id, null: false, index: true

      t.timestamps
    end
    add_index :likes, [:user_id, :topic_id], unique: true
  end
end
