# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
#
# # Users
#
  print "Creating Users... "
  User.destroy_all
#
 u1 = User.create!(
 email:     'lucy@lucyw.com',
 password:  'chicken',
first_name: 'Lucy',
last_name: 'Wirth',
address: '1 York St, Sydney, NSW, 2001',
clothing_size: '12',
)
u2 = User.create!(
email:     'jane@jane.com',
password:  'chicken',
first_name: 'Jane',
last_name: 'Doe',
address: '161 Sussex St, Sydney, NSW 2001',
clothing_size: '15'
)
u3 = User.create!(
email:     'john@john.com',
password:  'chicken',
first_name: 'John',
last_name: 'Smith',
address: '3/ 19 Hunter St, Sydney, NSW 2000',
clothing_size: '18'
)

u4 = User.create!(
email:     'Neil@n.com',
password:  'chicken',
first_name: 'Neil',
last_name: 'West',
address: '342 Elizabeth St, Sydney, NSW 2000',
clothing_size: '12'
)

puts "Done! Created #{ User.count } users."
Garment.destroy_all

g1 = Garment.create!(
  title:   'Wedding dress',
  garment_type:     'dress',
  size:             '12',
  points:           '10',
  user_id:          u1.id,
  description:     'broken vows dress'
)
g2 = Garment.create!(
  title:   'Bikini',
  garment_type:     'swimsuit',
  size:             '12',
  points:           '8',
  user_id:          u1.id,
  description:     'polka dot bikini'
)
g3 = Garment.create!(
  title:   'Business Suit',
  garment_type:     'Suit',
  size:             '14',
  points:           '25',
  user_id:          u1.id,
  description:     'I got two promotions in this suit'
)
g4 = Garment.create!(
  title:   'Shorts',
  garment_type:     'shorts',
  size:             '12',
  points:           '8',
  user_id:          u1.id,
  description:     'Wore in the Carribean'
)
g5 = Garment.create!(
  title:   'Wedding dress',
  garment_type:     'dress',
  size:             '12',
  points:           '10',
  user_id:          u1.id,
  description:     'broken vows dress'
)
g6 = Garment.create!(
  title:   'Bikini',
  garment_type:     'swimsuit',
  size:             '12',
  points:           '8',
  user_id:          u1.id,
  description:     'polka dot bikini'
)

puts "The first garment belongs to #{Garment.first.user.first_name}"

puts "The first user has the following garments #{User.first.garments.pluck(:title)}"

Photo.destroy_all
p1 = Photo.create!(
  image:  "https://images.unsplash.com/photo-1589849802886-163a178fdf46?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  caption: "May it bring you better luck than me",
  garment_id: g1.id,
)
p2 = Photo.create!(
  image:  "https://images.unsplash.com/photo-1440735562367-c8a2c50cf459?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80",
  caption: "polka polka polka",
  garment_id: g2.id,
)
p3 = Photo.create!(
  image:  "https://images.unsplash.com/photo-1502124103086-37d8f3d39954?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
  caption: "May it bring you better luck than me",
  garment_id: g3.id,
)
p4 = Photo.create!(
  image:  "https://images.unsplash.com/flagged/photo-1575873280796-66a2288d8abd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8c2hvcnRzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  caption: "polka polka polka",
  garment_id: g4.id,
)
p5 = Photo.create!(
  image:  "https://images.unsplash.com/photo-1589849802886-163a178fdf46?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  caption: "May it bring you better luck than me",
  garment_id: g5.id,
)
p6 = Photo.create!(
  image:  "https://unsplash.com/photos/1SHZkX2fbkY",
  caption: "polka polka polka",
  garment_id: g6.id,
)

puts "The first photo belongs to the following garment #{Garment.first.photos.pluck(:image)}"
# User.create!("firname:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin:     true,
#              activated: true,
#              activated_at: Time.zone.now)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name: name,
#               email: email,
#               password:              password,
#               password_confirmation: password,
#               activated: true,
#               activated_at: Time.zone.now)
# end
#
# # Microposts
# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(5)
#   users.each { |user| user.microposts.create!(content: content) }
# end
#
# # Following relationships
# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
#
# puts "created #{User.count} users."
