FactoryBot.define do
  factory :user do
    name { 'テスト太郎' }
    gender { :male }
    limit_level { :low }

    trait :login_user do
      role { :login }
      sequence(:email) { |n| "login_test#{n}@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
    end

    trait :admin_user do
      role { :admin }
      sequence(:email) { |n| "admin_test#{n}@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
    end
  end
end
