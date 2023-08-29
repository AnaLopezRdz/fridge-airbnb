# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Office.destroy_all
# User.destroy_all


# puts "All users and offices destroyed."
# puts "creating seeds"

maria = User.create(name: "Maria", email: "maria123@test.com", password: "123456")
User.create(name: "Ana", email: "ana@test.com", password: "holahola", photo: "https://res.cloudinary.com/dclozlnfy/image/upload/v1693334372/1FC5DBDC-96CB-4109-A690-BA52CA82D172_f3a4fj.jpg")
User.create(name: "Marina", email: "marina123@test.com", password: "hola")

Office.create(address: "157 Javastraat, The Hague, Netherlands", user_id: maria.id, price: 10, description: "A cute corner office with sunlight.", photos:[ "https://res.cloudinary.com/dclozlnfy/image/upload/v1693338599/development/683xuuglfhtz2iynqde4m2u54f09.jpg", "https://res.cloudinary.com/dclozlnfy/image/upload/v1693338041/production/t9izlwi4ztv0gykqkbez489trynb.avif"])
Office.create(address: "4 prinsessgracht, The Hague, Netherlands", user_id: maria.id, price: 30, description: "A large office good for meetings.", photos:["https://res.cloudinary.com/dclozlnfy/image/upload/v1693244396/development/rulftdsb814e8rg4r5j2tzi2n8xl.jpg"])
Office.create(address: "124 london wall, london Reino Unido", user_id: maria.id, price: 20, description: "Office in center of floor with glass walls.", photos:["https://res.cloudinary.com/dclozlnfy/image/upload/v1693338600/development/ycyfjr2xxftn3oszzufr3kjagt74.jpg", "https://res.cloudinary.com/dclozlnfy/image/upload/v1693338599/development/683xuuglfhtz2iynqde4m2u54f09.jpg"])

# puts "Offices created"

Booking.create!(
  start_date: Date.today,
  end_date: Date.today + 3.days,
  office_id: 16,
  user_id: maria.id
)

Booking.create!(
  start_date: Date.today + 1.day,
  end_date: Date.today + 4.days,
  office_id: 17,
  user_id: maria.id
)

Booking.create!(
  start_date: Date.today + 2.days,
  end_date: Date.today + 5.days,
  office_id: 18,
  user_id: maria.id
)
