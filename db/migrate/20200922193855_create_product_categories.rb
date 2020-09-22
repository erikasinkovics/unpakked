class CreateProductCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
