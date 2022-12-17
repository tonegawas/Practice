# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
    name: "ケーキ"
)

Genre.create!(
    name: "焼き菓子"
)

Genre.create!(
    name: "プリン"
)

Genre.create!(
    name: "キャンディ"
)

Item.create!(
    genre_id: 1,
    name: "チーズケーキ",
    introduction: "濃厚です",
    price: 500
)

Item.create!(
    genre_id: 2,
    name: "クッキー",
    introduction: "サクサク",
    price: 280
)

Item.create!(
    genre_id: 3,
    name: "焼きプリン",
    introduction: "卵いっぱい使ってます",
    price: 350
)

Item.create!(
    genre_id: 4,
    name: "ねりあめ",
    introduction: "昔ながらの",
    price: 90
)