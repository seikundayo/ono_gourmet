class AddShopIdToadmins < ActiveRecord::Migration[6.0]
  def change
    add_reference :admins, :shop, foreign_key: true
  end
end
