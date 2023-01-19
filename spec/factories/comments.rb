FactoryBot.define do
  factory :comment do
    description { Faker::Lorem.sentence }
    product
    user
  end
end
