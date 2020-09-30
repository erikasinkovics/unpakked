class AddDefaultFalseValueToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :admin, false
    change_column_default :users, :admin, false
    change_column_null :users, :store_owner, false
    change_column_default :users, :store_owner, false
  end
end
