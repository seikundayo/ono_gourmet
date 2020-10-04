class AddShopIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pro_id, :integer, default: 0
  end
end
