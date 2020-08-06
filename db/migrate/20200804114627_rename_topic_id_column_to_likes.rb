class RenameTopicIdColumnToLikes < ActiveRecord::Migration[6.0]
  def change
     rename_column :likes, :topic_id, :home_id
  end
end
