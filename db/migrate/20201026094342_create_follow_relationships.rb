class CreateFollowRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_relationships do |t|
      t.integer :user_id, null: false, index: true
      t.integer :admin_id, null: false, index: true

      t.timestamps
    end
    add_index :follow_relationships, [:user_id, :admin_id], unique: true
  end
end
