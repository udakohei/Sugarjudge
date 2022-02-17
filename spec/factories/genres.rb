FactoryBot.define do
  factory :genre do
    name { |n| "テストジャンル#{n}" }
  end
end
