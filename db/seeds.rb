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
  address: 'Address',
  clothing_size: 'Clothing Size'
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

puts "The first garment belongs to #{Garment.first.user.first_name}"

puts "The first user has the following garments #{User.first.garments.pluck(:title)}"

Photo.destroy_all
p1 = Photo.create!(
  image:  "https://unsplash.com/photos/p-38_f-WZkw",
  caption: "May it bring you better luck than me",
  garment_id: g1.id,
)

puts "The first photo belongs to the following garment #{Garment.first.photo.pluck(:image)}"
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
