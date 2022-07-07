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
Genre.create(name: 'ケーキ')
Genre.create(name: '焼き菓子')
Genre.create(name: 'プリン')
Genre.create(name: 'キャンディ')

Item.create(genre_id: 1, name: 'スイーツセット(4人前)', caption: '4人前', unit_price: '5000')
Item.create(genre_id: 2, name: 'ショートケーキ', caption: 'イチゴのショートケーキです．', unit_price: '500')
Item.create(genre_id: 2, name: 'ティラミス', caption: '苦いかも', unit_price: '700')
Item.create(genre_id: 3, name: 'クッキー', caption: '5枚入り．', unit_price: '200')
Item.create(genre_id: 5, name: 'りんご飴', caption: '少し大きめ', unit_price: '300')
