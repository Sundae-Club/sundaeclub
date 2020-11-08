FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user.num#{n}@example.com" }
    password 'password'
  end
end
