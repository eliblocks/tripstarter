# This will guess the User class
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { SecureRandom.hex }
  end

  factory :trip do
    title { "Beach" }
    origin  { "Park" }
    destination { "Beach" }
    departing_at { 1.day.from_now }
    capacity { 20 }
    requester { association :user }
  end
end
