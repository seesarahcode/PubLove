FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "bookmaker#{n}@lilpub.com" }
    first_name  Faker::Name.first_name
    last_name   Faker::Name.last_name
    password    'password'
    password_confirmation { |u| u.password }

    factory :super_admin do
      role      "super_admin"
    end

    factory :project_manager do
      role      "project_manager"
    end

    factory :admin do
      role      "admin"
    end

    factory :author do
      role      "author"
    end

    factory :team_member do
      role      "team_member"
    end

    
  end
end

