class CreateProductCategoryTags < ActiveRecord::Migration[6.0]
  def change
    create_table :product_category_tags do |t|
      t.references :store, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
