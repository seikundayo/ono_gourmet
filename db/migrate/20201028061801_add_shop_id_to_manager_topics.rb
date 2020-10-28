class AddShopIdToManagerTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :manager_topics, :shop, foreign_key: true
  end
end
