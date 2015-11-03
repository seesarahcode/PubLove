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
puts admin1.id
puts admin1.publisher_id
pub1 = Publisher.find_by_id(admin1.publisher_id)
pub1.update_attributes(name: "Booksly & Wordwood",
    street: "888 Globe Stage Place",
    state: "Washington", city: "Seattle", zip: 92527,
    phone: "800-555-4893", website: "www.bookslyandwordwood.com")
pm1 = User.new(email: "writefastedithard@gmail.com", 
    password: "password", password_confirmation: "password", 
    role: "project_manager", publisher_id: pub1.id)
pm1.save
book1 = Book.new(title: "All the Pretty Pages", 
    isbn: "978-3-16-148410-0", sku: "80001-1A", 
    pub_year: 2018, publisher_id: pub1.id)
book1.save
author1 = User.new(email: "brilliant_author@gmail.com", 
    password: "password", password_confirmation: "password", 
    role: "author", publisher_id: pub1.id)
author1.save
Date.new(2015, 10, 01).upto(Date.new(2016, 10, 01)) do |date|
    event = Event.new(event_type: "Phone call", date: date, time: Time.now.to_s(:time),
    title: "Phone call with J.K. Rowling")
    event.save
    event_att1 = EventAttendee.new(event_id: event.id, user_id: pm1.id)
    event_att2 = EventAttendee.new(event_id: event.id, user_id: author1.id)
    event_att1.save
    event_att2.save
end

admin2 = User.new(email: "lil_book_ceo@gmail.com",
    password: "password", password_confirmation: "password",
    role: "admin")
admin2.save
pub2 = Publisher.find(admin2.publisher_id)
pub2.update_attributes(name: "Lil Book Co.",
    street: "2138 Kerning Dr",
    state: "Georgia",
    city: "Atlanta",
    zip: 80293,
    phone: "800-555-2093",
    website: "www.lilbookco.com")

admin3 = User.new(email: "smutinc@gmail.com",
    password: "password", password_confirmation: "password",
    role: "admin")
admin3.save
pub3 = Publisher.find(admin3.publisher_id)
pub3.update_attributes(name: "Smut Inc.",
    street: "1930 Page Ave",
    state: "New York",
    city: "Yonkers",
    zip: 10939,
    phone: "800-555-3209",
    website: "www.smut.inc")