# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

{
  "midas_user" => "MIDAS User (can login and edit own data)",
  "midas_admin" => "MIDAS Administrator (can view and edit everything)",
  "spacenet_user" => "Spacenet User (can authenticate to spacenet here)"
}.each do |slug, desc|
  SsoUserAuthorisation.create(slug: slug, description: desc)
end

5.times do |i|
  Keyset.create(fob_number: "100#{i+1}")
end

mb = Person.create(name: "Muriel Bagge", address: "Bagge Farmhouse, Middle of Nowhere", telephone: "555-1234", email: "muriel.bagge@nowheremail.com")
mbu = SsoUser.create(username: "muriel", password: "mur13l", person: mb)
mbu.sso_user_authorisations << SsoUserAuthorisation.find_by_slug("midas_user")
mbu.sso_user_authorisations << SsoUserAuthorisation.find_by_slug("midas_admin")
Membership.create(person: mb, status: :active, keyset: Keyset.create(fob_number: "0123"))

ctcd = Person.create(name: "Courage", telephone: "555-9876")
ctcdu = SsoUser.create(username: "courage", password: "cour4g3", person: ctcd)
ctcdu.sso_user_authorisations << SsoUserAuthorisation.find_by_slug("midas_user")
EmergencyContact.create(contact: ctcd, for: mb, relation: "Dog")
Note.create(noter: mb, notable: ctcd, body: "Courage is a good dog")
