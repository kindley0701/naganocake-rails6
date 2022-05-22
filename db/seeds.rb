# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'a@a',
   password: 'aaaaaa'
)

Genre.create(name: 'アソート')

Item.create(genre_id: 6, name: 'スイーツセット(4人前)', caption: '4人前', unit_price: '5000')
