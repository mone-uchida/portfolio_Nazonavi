FactoryBot.define do
  factory :user do
    name { 'test' }
    sequence(:email) { |n| "person#{n}@example.com" }
    password_digest { 'password' }
    icon { 'default_user.jpg' }
  end

  factory :duplication_user, class: User do
    name { 'test' }
    email { 'test@example.com' }
    password_digest { 'password' }
    icon { 'default_user.jpg' }
  end
end
