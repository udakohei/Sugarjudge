FactoryBot.define do
  factory :genre do
    sequence(:name) { |n| "テストジャンル#{n}" }
  end
end
