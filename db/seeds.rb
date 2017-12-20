# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: 'chris@email.com', password: 'password', id: 1)
Question.create!(content: 'Should I buy a new iPhone?', user_id: 1)
Question.create!(content: 'Should I get my 8 year old daughter a dog?', user_id: 1)
Question.create!(content: 'Is $20 per month a reasonable allowance for an 11 year old boy?', user_id: 1)
Question.create!(content: 'Is it worth it to upgrade my internet speed from 15 mbps to 30 mbps for $20 more per month?', user_id: 1)
Question.create!(content: 'Is living in downtown San Francisco worth the cost of living?', user_id: 1)
