FactoryBot.define do
  factory :user do
    name { 'test' }
    sequence(:email) { |n| "person#{n}@example.com" }
    password_digest { 'password' }
    icon { 'default_user.jpg' }
  end
end
