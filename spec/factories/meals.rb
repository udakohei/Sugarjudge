FactoryBot.define do
  factory :meal do
    meal_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/apple.jpeg')) }
    association :user
  end
end
