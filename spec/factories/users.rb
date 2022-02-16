FactoryBot.define do
  factory :user do
    name { 'テスト太郎' }
    gender { :male }
    limit_level { :low }
  end
end
