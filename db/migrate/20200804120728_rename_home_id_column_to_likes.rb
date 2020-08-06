class RenameHomeIdColumnToLikes < ActiveRecord::Migration[6.0]
  def change
    rename_column :likes, :home_id, :topic_id
  end
end
