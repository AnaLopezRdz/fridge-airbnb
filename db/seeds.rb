# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#Office.destroy_all
#User.destroy_all


# puts "All users and offices destroyed."
# puts "creating seeds"


def full_identifier(image)
  params = {version: image.file.version, public_id: image.file.public_id}
  signature = Cloudinary::Utils.sign_request(params)[:signature]
  image.file.identifier + '#' + signature
end

current_user = User.find(:id)
main_image = full_identifier(current_user.main_image)


maria = User.new(name: "Maria", email: "maria123@test.com", password: "123456")
maria.save


# maria = User.create(name: "Maria", email: "maria123@test.com", password: "123456")
# User.create(name: "Ana", email: "ana@test.com", password: "holahola")
# User.create(name: "Marina", email: "marina123@test.com", password: "hola")

Office.create(address: "157 Javastraat, The Hague, Netherlands", user_id: maria.id, price: 10, description: "A cute corner office with sunlight.")
Office.create(address: "4 prinsessgracht, The Hague, Netherlands", user_id: maria.id, price: 30, description: "A large office good for meetings.")
Office.create(address: "124 london wall, london Reino Unido", user_id: maria.id, price: 20, description: "Office in center of floor with glass walls.")

# puts "Offices created"

Booking.create!(
  start_date: Date.today,
  end_date: Date.today + 3.days,
  office_id: 16,
  user: maria
)

Booking.create!(
  start_date: Date.today + 1.day,
  end_date: Date.today + 4.days,
  office_id: 17,
  user: maria
)

Booking.create!(
  start_date: Date.today + 2.days,
  end_date: Date.today + 5.days,
  office_id: 18,
  user: maria
)
