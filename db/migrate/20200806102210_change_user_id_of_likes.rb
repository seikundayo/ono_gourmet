class ChangeUserIdOfLikes < ActiveRecord::Migration[6.0]
  def up
    change_column :likes, :user_id, :integer, default: 0, null: true
  end

  def down
    change_column :likes, :user_id, :integer, default: 0, null: false
  end
end
