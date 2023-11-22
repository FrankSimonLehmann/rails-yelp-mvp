# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

restaurants = Restaurant.all

puts "Cleaning database..."
Restaurant.destroy_all

puts "creates restaurants..."
100.times do Restaurant.create(
  name: Faker::Name.name,
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  category: ["chinese", "italian", "japanese", "french", "belgian"].sample
)
end

puts "creating reviews..."
100.times do Review.create(
  rating: [0, 1, 2, 3, 4, 5].sample,
  content: Faker::Restaurant.review,
  restaurant_id: Restaurant.ids.sample
)
end

puts "Finished!"
