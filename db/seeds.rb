# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

City.destroy_all
Doctor.destroy_all
Speciality.destroy_all
SpecialityDoctor.destroy_all
Patient.destroy_all
Appointement.destroy_all

100.times do
    city = City.create(
        name: Faker::Address.city
    )
    
    doc = Doctor.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        zip_code: Faker::Address.zip_code,
        city: city
    )

    spe = Speciality.create(
        name: Faker::Lorem.characters(number: 10)
    )

    SpecialityDoctor.create(
        doctor: doc,
        speciality: spe
    )

    pat = Patient.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        city: city
    )

    Appointement.create(
        city: city,
        date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
        doctor: doc,
        patient: pat
    )
end