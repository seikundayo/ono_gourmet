class CreateManagerTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :manager_topics do |t|
      t.string :title
      t.text :word
      t.references :shop, foreign_key: true
      t.references :manager, foreign_key: true
      t.timestamps
    end
  end
end
