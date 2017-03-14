# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


testhouse = House.create(name: "House1", address: "111 Address St", image: "http://images.all-free-download.com/images/graphiclarge/home_clip_art_17386.jpg", status: "ready")
testhouse2 = House.create(name: "House2", address: "222 Address St", image: "http://images.all-free-download.com/images/graphiclarge/home_clip_art_17386.jpg", status: "pending")
testhouse3 = House.create(name: "House3", address: "333 Address St", image: "http://images.all-free-download.com/images/graphiclarge/home_clip_art_17386.jpg", status: "ready")

testhouse4 = House.create(name: "House4", address: "444 Address St", image: "http://images.all-free-download.com/images/graphiclarge/home_clip_art_17386.jpg", status: "pending")
testhouse5 = House.create(name: "House5", address: "555 Address St", image: "http://images.all-free-download.com/images/graphiclarge/home_clip_art_17386.jpg", status: "pending")




chandler = User.create(first_name: "Chandler", last_name: "Childs", email: "rubberband75@gmail.com", password: "admin1", password_confirmation: 'admin1', role: "admin")
andrew = User.create(first_name: "Andrew", last_name: "Germaine", email: "andrew.p.germaine@gmail.com", password: "asdf", password_confirmation: 'asdf', role: "admin")
admin = User.create(first_name: "Super", last_name: "User", email: "admin@envisionit360.com", password: "admin", password_confirmation: "admin", role: "admin")
builder = User.create(first_name: "Sample", last_name: "Builder", email: "builder@envisionit360.com", password: "builder", password_confirmation: "builder", role: "builder")
buyer = User.create(first_name: "John", last_name: "Doe", email: "buyer@envisionit360.com", password: "buyer", password_confirmation: "buyer", role: "buyer")
buyer2 = User.create(first_name: "Jane", last_name: "Doe", email: "buyer2@envisionit360.com", password: "buyer", password_confirmation: "buyer", role: "buyer")
builder2 = User.create(first_name: "Ivory", last_name: "Homes", email: "ivory@homes.com", password: "ivory", password_confirmation: "ivory", role: "builder")

builder.houses << [testhouse, testhouse2, testhouse3]
builder.customers << [buyer2, buyer]
buyer.assigned_house = testhouse
buyer2.assigned_house = testhouse3

builder2.houses << [testhouse4, testhouse5]



