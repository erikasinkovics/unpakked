class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :city
      t.string :postal_code
      t.string :address
      t.float :avg_rating
      t.references :user, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
