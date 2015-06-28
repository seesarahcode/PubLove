FactoryGirl.define do
  factory :project_manager, class: User do
    sequence(:email) { |n| "editor#{rand(10)}@lilpub.com" }
    password 'password'
    password_confirmation { |u| u.password }
    role "project_manager"
  end

  factory :super_admin, class: User do
    sequence(:email) { |n| "sarah@bookward.com" }
    password 'password'
    password_confirmation { |u| u.password }
    role "super_admin"
  end

  factory :admin, class: User do
    sequence(:email) { |n| "editor#{rand(10)}@lilpub.com" }
    password 'password'
    password_confirmation { |u| u.password }
    role "admin"
  end
  factory :author, class: User do
    sequence(:email) { |n| "editor#{rand(10)}@lilpub.com" }
    password 'password'
    password_confirmation { |u| u.password }
    role "author"
  end
end

