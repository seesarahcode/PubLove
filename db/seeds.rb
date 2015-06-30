# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



publisher1 = Publisher.create(name: "Booksly & Wordwood",
    street: "888 Globe Stage Place",
    state: "Washington",
    city: "Seattle",
    zip: 92527,
    phone: "800-555-4893",
    website: "www.bookslyandwordwood.com")

publisher2 = Publisher.create(name: "Lil Book Co.",
    street: "2138 Kerning Dr",
    state: "Georgia",
    city: "Atlanta",
    zip: 80293,
    phone: "800-555-2093",
    website: "www.lilbookco.com")

publisher3 = Publisher.create(name: "Smut Inc.",
    street: "1930 Page Ave",
    state: "New York",
    city: "Yonkers",
    zip: 10939,
    phone: "800-555-3209",
    website: "www.smut.inc")