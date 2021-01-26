# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Unit.create(name: 'Troop 1564', start_date: Date.today - 1.days, end_date: Date.today + 25.days, miles_goal: 10)
Unit.create(name: 'Troop 1804', start_date: Date.today - 1.days, end_date: Date.today + 25.days, miles_goal: 10)
