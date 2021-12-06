# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Game.destroy_all
User.destroy_all
Participant.destroy_all

puts "seeding users..."
15.times do
    name = Faker::Name.name
    age = rand(18..45)
    email = "#{name}@aol.com"
    city = Faker::Address.city
    User.create(name: name, age: age, email: email, city: city)                           
end

puts "seeding games..."
10.times do
    sport = "basketball"
    date = "2022-02-10 20:00:00 +0000"
    description = Faker::ChuckNorris.fact
    location = Faker::Address.city
    max_players = rand(30..36)
    current_players = rand(2..29)
    host_id = rand(1..15)
    Game.create(name: sport, sport: sport, location: location, current_players: current_players, max_players: max_players,
    host_id: host_id, description: description, date: date)
    
end

puts "seeding participants..."
50.times do
    user_id = rand(1..15)
    game_id = rand(1..10)
    Participant.create(user_id: user_id, game_id: game_id)
end
puts "Done Seeding!"
# chad = User.create(name: "Chad", age: 26, email: "chad_the_lad@sportsball.com", city: "Toronto", )
# tommy = User.create(name: "Tommy")
# ashley = User.create(name: "Ashley")

# flag_footbal = Game.create(name: "chads flag football game", sport: "flag football", location: "toronto YMCA", 
# current_players: 1, max_players: 24, description: "chad is hosting a flag football match", host_id: chad.id)

# part1 = Participant.create(game_id: flag_footbal.id, user_id: chad.id)
# part2 = Participant.create(game_id: flag_footbal.id, user_id: ashley.id)
# part3 = Participant.create(game_id: flag_footbal.id, user_id: tommy.id)

