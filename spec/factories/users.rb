FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "editor#{rand(100)}@lilpub.com" }
    password 'password'
    password_confirmation { |u| u.password }

    factory :super_admin do
      role "super_admin"
    end

    factory :project_manager do
      role "project_manager"
      sequence(:publisher_id) {|n| n }
    end

    factory :admin do
      role "admin"
      sequence(:publisher_id) {|n| n }
    end

    factory :author do
      role "author"
      sequence(:publisher_id) {|n| n }
    end
  end
end

