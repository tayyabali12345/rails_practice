include ActionDispatch::TestProcess
require 'faker'
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    image { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/tayyab.jpeg") }
  end
end
