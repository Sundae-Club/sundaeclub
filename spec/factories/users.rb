FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user.num#{n}@example.com" }
    password 'password'
    organisation

    trait :confirmed do
      confirmed_at Time.current
    end
  end
end
