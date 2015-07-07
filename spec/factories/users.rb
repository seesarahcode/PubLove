FactoryGirl.define do
  factory :user do
    email       Faker::Internet.email
    first_name  Faker::Name.first_name
    last_name   Faker::Name.last_name
    password    'password'
    password_confirmation { |u| u.password }
    sequence(:publisher_id) {|n| n }

    factory :super_admin do
      role "super_admin"
    end

    factory :project_manager do
      role        "project_manager"
    end

    factory :admin do
      role        "admin"
    end

    factory :author do
      role      "author"
    end
  end
end

