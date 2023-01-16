include ActionDispatch::TestProcess
require 'faker'
FactoryBot.define do
  factory :product do
    name { Faker::Commerce.name }
    price { Faker::Number.between(from: 1, to: 999) }
    description { Faker::Lorem.sentence }
    images { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/tayyab.jpeg") }
    user
  end
end
