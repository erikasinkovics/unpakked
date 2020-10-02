puts "Let the seeding begin!"
puts "Destroying... everything!"

Review.destroy_all
Store.destroy_all
User.destroy_all
ProductCategoryTag.destroy_all
ProductCategory.destroy_all

# resetting all seed IDs to start from 1 again
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "Db is clean."

puts "Creating product categories..."

produce = ProductCategory.create!({name: "produce"})
bakery = ProductCategory.create!({name: "bakery"})
grains = ProductCategory.create!({name: "grains"})
coffee = ProductCategory.create!({name: "coffee"})
tea = ProductCategory.create!({name: "tea"})
oils = ProductCategory.create!({name: "oils and vinegars"})
kombucha = ProductCategory.create!({name: "kombucha"})
sweets = ProductCategory.create!({name: "sweets"})
pasta = ProductCategory.create!({name: "pasta"})
dairy = ProductCategory.create!({name: "dairy"})
dried_fruits = ProductCategory.create!({name: "dried fruits"})
nuts = ProductCategory.create!({name: "nuts"})
household = ProductCategory.create!({name: "household items"})
cleaning = ProductCategory.create!({name: "cleaning"})
beauty = ProductCategory.create!({name: "beauty"})
personal_hygiene = ProductCategory.create!({name: "personal hygiene"})

listOfCategories = [produce, bakery, grains, coffee, tea, oils, kombucha, sweets, pasta, dairy, dried_fruits, nuts, household, cleaning, beauty, personal_hygiene]

puts "Product categories successfully created!"


puts "Generating users..."

erika = User.create!({
  email: "erika@email.com",
  password: "123456",
  first_name: "Erika",
  last_name: "Sinkovics",
  city: "Montréal",
  postal_code: "H2T 1X3",
  address: "5333 Avenue Casgrain, Suite 102",
  admin: true
})

wince = User.create!({
  email: "wince@email.com",
  password: "123456",
  first_name: "Wince",
  last_name: "Shum",
  city: "Montréal",
  postal_code: "H2T 1X3",
  address: "5333 Avenue Casgrain, Suite 102",
  admin: true
})

puts "Users have been created!"


puts "Creating stores..."

opoidsvert = Store.create!({
  name: "Ô Poids Vert",
  city: "Montréal",
  postal_code: "H1L 2N2",
  address: "8874 Rue Hochelaga",
  user_id: 1,
  status: true
  # status is set 'true', indicating that this store has been reviewed and approved by admins.
})

terreasoi_hochelaga = Store.create!({
  name: "Terre à soi",
  city: "Montréal",
  postal_code: "H1W 1R7",
  address: "3580 rue Ontario Est",
  user_id: 2,
  status: true
})

terreasoi_tetreau = Store.create!({
  name: "Terre à soi",
  city: "Montréal",
  postal_code: "H1L 2M7",
  address: "8748 Rue Hochelaga",
  user_id: 1,
  status: true
})

puts "Stores have been created!"


puts "Assigning categories to stores..."

ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: produce.id})
ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: bakery.id})
ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: grains.id})
ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: coffee.id})
ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: tea.id})
ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: oils.id})
ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: sweets.id})
ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: pasta.id})
ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: nuts.id})
ProductCategoryTag.create!({store_id: opoidsvert.id, product_category_id: dairy.id})

ProductCategoryTag.create!({store_id: terreasoi_hochelaga.id, product_category_id: household.id})
ProductCategoryTag.create!({store_id: terreasoi_hochelaga.id, product_category_id: cleaning.id})
ProductCategoryTag.create!({store_id: terreasoi_hochelaga.id, product_category_id: beauty.id})
ProductCategoryTag.create!({store_id: terreasoi_hochelaga.id, product_category_id: coffee.id})
ProductCategoryTag.create!({store_id: terreasoi_hochelaga.id, product_category_id: tea.id})
ProductCategoryTag.create!({store_id: terreasoi_hochelaga.id, product_category_id: personal_hygiene.id})

ProductCategoryTag.create!({store_id: terreasoi_tetreau.id, product_category_id: household.id})
ProductCategoryTag.create!({store_id: terreasoi_tetreau.id, product_category_id: cleaning.id})
ProductCategoryTag.create!({store_id: terreasoi_tetreau.id, product_category_id: beauty.id})
ProductCategoryTag.create!({store_id: terreasoi_tetreau.id, product_category_id: coffee.id})
ProductCategoryTag.create!({store_id: terreasoi_tetreau.id, product_category_id: tea.id})
ProductCategoryTag.create!({store_id: terreasoi_tetreau.id, product_category_id: personal_hygiene.id})

puts "ProductCategories are now assiged to stores."

puts "SEED SUCCESSFUL! YAY!"
