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


puts "Done Seeding!"
# chad = User.create(name: "Chad", age: 26, email: "chad_the_lad@sportsball.com", city: "Toronto", )
# tommy = User.create(name: "Tommy")
# ashley = User.create(name: "Ashley")

# flag_footbal = Game.create(name: "chads flag football game", sport: "flag football", location: "toronto YMCA", 
# current_players: 1, max_players: 24, description: "chad is hosting a flag football match", host_id: chad.id)

# part1 = Participant.create(game_id: flag_footbal.id, user_id: chad.id)
# part2 = Participant.create(game_id: flag_footbal.id, user_id: ashley.id)
# part3 = Participant.create(game_id: flag_footbal.id, user_id: tommy.id)

