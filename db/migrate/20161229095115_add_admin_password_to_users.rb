class AddAdminPasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin_password, :string
  end
end
