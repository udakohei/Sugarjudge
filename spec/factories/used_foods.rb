FactoryBot.define do
  factory :used_food do
    association :meal
    association :food
  end
end
