class AddAdminIdToManagerTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :manager_topics, :admin, foreign_key: true
    remove_reference :manager_topics, :manager, index: true, foreign_key: true
    remove_reference :manager_topics, :shop, index: true, foreign_key: true
  end
end
