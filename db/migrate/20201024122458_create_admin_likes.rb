class CreateAdminLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_likes do |t|
      t.integer :admin_id, null: false, index: true
      t.integer :topic_id, null: false, index: true

      t.timestamps
    end
     add_index :admin_likes, [:admin_id, :topic_id], unique: true
  end
end
