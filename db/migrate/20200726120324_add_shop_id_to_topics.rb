class AddShopIdToTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :topics, :shop, foreign_key: true
  end
end
