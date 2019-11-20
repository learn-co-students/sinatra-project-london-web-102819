require 'faker'

30.times {User.create(name: Faker::Name.unique.name)}

15.times {Restaurant.create(name: Faker::Restaurant.unique.name, rating: rand(1..5), address: Faker::Address.unique.street_address)}

100.times {UserRestaurant.create(user_id: User.all.map{|u| u.id}.sample, restaurant_id: Restaurant.all.map{|r| r.id}.sample )}