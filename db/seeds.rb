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


chad = User.create(name: "Chad", age: 18, email: "chad@123.com", password: "123ABC", password_confirmation: "123ABC", profile_pic: "https://au.reachout.com/-/media/young-people/images/legacy-articles/girls-playing-soccer.jpg")
lara = User.create(name: "Lara", age: 22, email: "lara@123.com", password: "123ABC", password_confirmation: "123ABC", profile_pic: "https://www.electricireland.com/images/folder/homepage-spotlights/benefits-0.jpg?sfvrsn=bc86ba0d_2")
dave = User.create(name: "Dave", age: 28, email: "dave@123.com", password: "123ABC", password_confirmation: "123ABC",  profile_pic: "https://cdn.britannica.com/84/139484-050-D91679CC/Michael-Ballack-Germany-Italy-Cristian-Zaccardo-March-1-2006.jpg")
liz = User.create(name: 'Liz', age: 33, email: "liz@123.com", password: "123ABC", password_confirmation: "123ABC", profile_pic: "https://www.nols.edu/media/filer_public_thumbnails/filer_public/2c/a2/2ca21b5d-0e27-4b5e-8651-f70ea9cb65c5/matt_hage_climbing-20.jpg__960x720_q70_crop_subject_location-1666%2C1596_subsampling-2_upscale.jpg")

football = Game.create(name: "Chad's football game", date: "2022-02-10 20:00:00 +0000", sport: "flag footbal", location: "Local CC field", current_players:0,  max_players: 24, description: "flag footbal then beers?", host_id: chad.id)
soccer = Game.create(name: "Soccer for Noobs", date: "2022-02-10 20:00:00 +0000", sport: "Soccer", location: "U of M club athletic field 4",  current_players:0, max_players: 24, description: "casual soccer game for bored people.", host_id: liz.id)
tennis = Game.create(name: "Tennis doubles pickup", date: "2022-02-10 20:00:00 +0000", sport: "Tennis", location: "Moran Park Courts",  current_players:0, max_players: 4, description: "Tennis doubles match", host_id: dave.id)
vollyball = Game.create(name: "Summer Beach Vollybal", date: "2022-06-10 20:00:00 +0000", sport: "Vollyball", location: "Clinch park Vollyball courts", current_players: game.participants,  max_players: 8, description: "Beach Vollyball games, public park so no alcohol please", host_id: lara.id)

11.times do
    email = Faker::Internet.email
    name = Faker::Name.name
    User.create(name: name, age: rand(18..75), email: email, password: "123ABC", password_confirmation: "123ABC", profile_pic: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png')
end

40.times do
    game = rand(1..4)
    user = rand(1..5)
    Participant.create(game_id: game, user_id: user)
end



# flag_footbal = Game.create(name: "chads flag football game", sport: "flag football", location: "toronto YMCA", 
# current_players: 1, max_players: 24, description: "chad is hosting a flag football match", host_id: chad.id)

# part1 = Participant.create(game_id: flag_footbal.id, user_id: chad.id)
# part2 = Participant.create(game_id: flag_footbal.id, user_id: ashley.id)
# part3 = Participant.create(game_id: flag_footbal.id, user_id: tommy.id)

