class RemoveContentFromTopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :content, :text
  end
end
