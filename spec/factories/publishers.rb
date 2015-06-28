# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher do
    name "Booksly & Wordwood"
    street "888 Globe Stage Place"
    state "Washington"
    city "Seattle"
    zip 92527
    phone "800-555-4893"
    website "www.bookslyandwordwood.com"
  end
end
