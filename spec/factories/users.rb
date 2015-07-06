FactoryGirl.define do
  factory :user do
    email       Faker::Internet.email
    first_name  Faker::Name.first_name
    last_name   Faker::Name.last_name
    password    'password'
    password_confirmation { |u| u.password }
    association :profile, factory: :user_profile

    factory :super_admin do
      email       Faker::Internet.email
      role "super_admin"
    end

    factory :project_manager do
      email       Faker::Internet.email
      role "project_manager"
      sequence(:publisher_id) {|n| n }
    end

    factory :admin do
      email       Faker::Internet.email
      role "admin"
      sequence(:publisher_id) {|n| n }
    end

    factory :author do
      email       Faker::Internet.email
      role "author"
      sequence(:publisher_id) {|n| n }
    end
  end
end

