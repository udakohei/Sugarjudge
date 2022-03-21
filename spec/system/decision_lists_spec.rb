require 'rails_helper'

RSpec.describe "DecisionLists", type: :system do
  let!(:meal_1) { create(:meal, balance_of_payments: rand(100)) }
  let!(:meal_2) { create(:meal, balance_of_payments: rand(100)) }
  let!(:meal_3) { create(:meal, balance_of_payments: rand(100)) }
  it '全ての判定結果が表示される' do
    visit root_path
    click_on '判定結果一覧'
    expect(page).to have_content meal_1.balance_of_payments
    expect(page).to have_content meal_2.balance_of_payments
    expect(page).to have_content meal_3.balance_of_payments
  end
end
