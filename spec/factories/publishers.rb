# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publisher do
    name "MyString"
    street "MyString"
    state "MyString"
    city "MyString"
    zip 1
    phone "MyString"
    website "MyString"
  end
end
