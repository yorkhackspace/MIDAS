# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

mb = Person.create(name: "Muriel Bagge", address: "Bagge Farmhouse, Middle of Nowhere", telephone: "555-1234", email: "muriel.bagge@nowheremail.com")
ctcd = Person.create(name: "Courage", telephone: "555-9876")
EmergencyContact.create(contact: ctcd, for: mb, relation: "Dog")
SsoUser.create(username: "muriel", password: "mur13l", person: mb)
Note.create(noter: mb, notable: ctcd, body: "Courage is a good dog")
5.times do |i|
  Keyset.create(fob_number: "100#{i+1}")
end
Membership.create(person: mb, status: :active, keyset: Keyset.create(fob_number: "0123"))
