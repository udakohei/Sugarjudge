FactoryBot.define do
  factory :comment do
    body { 'テストコメント'}
    association :user
    association :meal
  end
end
