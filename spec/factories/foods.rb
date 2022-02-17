FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "テストフード#{n}" }
    sugar { rand(100) }
    role { rand(2) }
    association :genre
  end
end
