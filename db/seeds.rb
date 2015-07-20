# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin1 = User.create(email: "msbooksly@gmail.com",
    password: "password", password_confirmation: "password",
    role: "admin")
admin1.publisher.update_attributes(name: "Booksly & Wordwood",
    street: "888 Globe Stage Place",
    state: "Washington",
    city: "Seattle",
    zip: 92527,
    phone: "800-555-4893",
    website: "www.bookslyandwordwood.com")


admin2 = User.create(email: "lil_book_ceo@gmail.com",
    password: "password", password_confirmation: "password",
    role: "admin")
admin2.publisher.update_attributes(name: "Lil Book Co.",
    street: "2138 Kerning Dr",
    state: "Georgia",
    city: "Atlanta",
    zip: 80293,
    phone: "800-555-2093",
    website: "www.lilbookco.com")

admin3 = User.create(email: "smutinc@gmail.com",
    password: "password", password_confirmation: "password",
    role: "admin")
admin3.publisher.update_attributes(name: "Smut Inc.",
    street: "1930 Page Ave",
    state: "New York",
    city: "Yonkers",
    zip: 10939,
    phone: "800-555-3209",
    website: "www.smut.inc")