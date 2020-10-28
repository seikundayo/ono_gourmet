class AddColumnAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :admin_name, :string
    add_column :admins, :admin_image, :string
  end
end
