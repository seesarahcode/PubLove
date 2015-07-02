FactoryGirl.define do
  factory :book do
    title "Harry Potter and Goblet of Awesome"
    sequence(:isbn) { |n| "#{rand(10 ** 13)}"}
    sequence(:sku) { |n| rand(10 ** 5) }
    pub_year 2015
    publisher
  end
end