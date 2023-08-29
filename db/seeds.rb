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
maria = User.create(name: "Ana", email: "ana@test.com", password: "holahola")
marina = User.create(name: "Marina", email: "marina123@test.com", password: "hola")

Office.create(address: "157 Javastraat, the hague, netherlands", user_id: maria.id, price: 10, description: "A cute corner office with sunlight.")
Office.create(address: "456 Apple Street", user_id: maria.id, price: 30, description: "A large office good for meetings.")
Office.create(address: "78 Orange Street", user_id: maria.id, price: 20, description: "Office in center of floor with glass walls.")

# puts "Offices created"

Booking.create!(
  start_date: Date.today,
  end_date: Date.today + 3.days,
  office_id: 16,
  user_id: 10
)

Booking.create!(
  start_date: Date.today + 1.day,
  end_date: Date.today + 4.days,
  office_id: 17,
  user_id: 10
)

Booking.create!(
  start_date: Date.today + 2.days,
  end_date: Date.today + 5.days,
  office_id: 18,
  user_id: 10
)
