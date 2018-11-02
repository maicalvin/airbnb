# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Users
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::Name.first_name 
    user['email'] = Faker::Internet.email
    user['gender'] = rand(1..2)
    user['birthday'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['feature'] = ["Gym", " Sauna"].sample

    listing['num_bed'] = rand(0..5)
    listing['num_room'] = rand(1..6)
    listing['num_bath'] = rand(1..10)
    listing['num_people'] = rand(1..10)


    listing['address'] = Faker::Address.street_address

    listing['price'] = rand(80..500)

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end