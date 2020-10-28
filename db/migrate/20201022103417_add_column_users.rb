class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birthday, :date
    add_column :users, :user_image, :string
    remove_column :users, :pro_id, :integer, default: 0
  end
end
