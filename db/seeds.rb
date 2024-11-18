# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

10.times do
  full_name = Faker::Name.name
  users = Faker::Internet.user
  username = users[:username]
  user_email = users[:email]
  user_password = users[:password]
  first_name = full_name.split.first
  last_name = full_name.split.last

  User.create!(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: user_email,
    password: user_password
  )
end

items = {title: ["camping", "hiking", "climbing gear", "skiing", "snowboarding", "snow gear", "soccer", "basketball", "volleyball", "weights", "cardio machines", "yoga gear", "bikes", "electric scooters", "accessories", "golf", "tennis", "pickleball", "skateboarding", "BMX", "paragliding"],
categories: ["Outdoor Adventure", "Water Sports", "Winter Sports", "Team Sports", "Fitness & Training", "Cycling", "Recreational Sports", "Extreme Sports"],
url: ["https://petapixel.com/assets/uploads/2022/09/SportsPhotographerBasketball1-800x800.jpeg", "https://static.euronews.com/articles/stories/05/89/34/62/1200x675_cmsv2_c8374f74-3e7e-5390-89cf-9383e3b72570-5893462.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJav821-VzLh7i2midUdvoeKZzhfJwLPZc-Q&s", "https://verticalraise.com/wp-content/uploads/2023/03/VerticalRaiseLLC-230343-Importance-Sports-Schools-Blogbanner1.jpg", "https://www.fshfcknoxvillegym.com/wp-content/uploads/sites/4/2019/08/Fitness-4-e1565724877462.jpg", "https://cdn.shopify.com/s/files/1/0551/0388/1250/files/cycling_benefits_styrkr.jpg?v=1676894320", "https://images.fastcompany.com/image/upload/f_webp,q_auto,c_fit/wp-cms-2/2024/07/p-91164425-paris-olympics-2024-and-power-of-womens-sports.jpg"]
}


50.times do
  description = Faker::Lorem.paragraph(sentence_count: 3)
  price = Faker::Commerce.price(range: 200..500.0, as_string: true)
  location = Faker::Address.country

  Item.create!(
   title: items[:title].sample,
   category: items[:categories].sample,
   location: location,
   price: price,
   description: description,
   image_url: items[:url].sample
  )
end
