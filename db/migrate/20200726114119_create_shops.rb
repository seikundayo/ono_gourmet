class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :number
      t.string :address
      t.string :access
      t.string :time
      t.string :rest
      t.string :takeout
      t.string :map
      t.string :introduce
      t.string :shop_image
      t.timestamps
    end
  end
end
