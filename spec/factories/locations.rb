FactoryBot.define do
  factory :location do
    association :user

    place            {Faker::Address.street_address}
    prefecture_id    {Faker::Number.between(from: 1, to: 47)}
    address          {Faker::Address.street_address}
    contact_address  {Faker::Number.decimal_part(digits: 11)}

    after(:build) do |location|
      location.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end