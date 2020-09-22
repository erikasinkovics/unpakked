class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :admin, :boolean
    add_column :users, :store_owner, :boolean
  end
end
