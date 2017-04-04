# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.create(username: "mkant", password_digest: "0203-2748")
Teacher.create(first_name: "Dummy", last_name: "Teacher", email: "dummy.teacher@gmail.com", phone: "6507418802", password: "0203-2748", password_confirmation: "0203-2748", country: "United States Of America", gender: "Male", email_confirmed: true, acceptance_of_terms: true)
