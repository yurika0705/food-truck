FactoryBot.define do
  factory :event do
    title            { Faker::Lorem.sentence }
    start_time       { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }

    association :location_id
    association :user_id
  end
end
