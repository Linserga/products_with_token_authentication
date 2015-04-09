# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(
	email: 'user@example.org',
	password: '123'
)

3.times do 
	user.products.create!(
		name: Faker::Commerce.product_name,
		quantity: Faker::Number.number(2),
		price: Faker::Commerce.price
	)
end

puts "**DONE**"