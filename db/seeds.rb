# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create!(family_name: "大田", given_name: "一郎", family_name_kana: "おおた", given_name_kana: "いちろう", email: "otai@gmail.com", password: "password", postal_code: "1460092", prefecture: "東京都", address: "大田区", phone_number: "09056334564", is_active: true)
Customer.create!(family_name: "浜松", given_name: "太郎", family_name_kana: "はままつ", given_name_kana: "たろう", email: "hamamatsut@gmail.com", password: "password", postal_code: "4300927", prefecture: "静岡県", address: "浜松市中区旭町", phone_number: "07087341542", is_active: true)
Admin.create!(email: "admin@gmail.com", password: "password")