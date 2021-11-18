# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(name: 'ジャンル１')
Genre.create!(name: 'ジャンル２')

10.times do
  Food.create!(
    name: Faker::Food.unique.dish,
    calorie: Faker::Number.number(digits: 3),
    role: :concrete,
    genre: Genre.first
  )
  Food.create!(
    name: Faker::Food.unique.ingredient,
    calorie: Faker::Number.number(digits: 3),
    role: :concrete,
    genre: Genre.last
  )
end