require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with body, user_id, meal_id' do
    comment = build(:comment)
    expect(comment).to be_valid
  end

  it 'is invalid without body' do
    comment_without_body = build(:comment, body: '')
    expect(comment_without_body).to be_invalid
    expect(comment_without_body.errors[:body]).to include 'を入力してください'
  end

  it 'is invalid without user_id' do
    comment_without_user_id = build(:comment, user_id: nil)
    expect(comment_without_user_id).to be_invalid
  end

  it 'is invalid without meal_id' do
    comment_without_meal_id = build(:comment, meal_id: nil)
    expect(comment_without_meal_id).to be_invalid
  end

  it 'is valid when body is shorter than 65535' do
    comment_with_shorter_body = build(:comment, body: 'あ' * 65534)
    expect(comment_with_shorter_body).to be_valid
  end

  it 'is valid when body is 65535' do
    comment_with_65535_body = build(:comment, body: 'あ' * 65535)
    expect(comment_with_65535_body).to be_valid
  end

  it 'is invalid when body is longer than 65535' do
    comment_with_longer_body = build(:comment, body: 'あ' * 65536)
    expect(comment_with_longer_body).to be_invalid
    expect(comment_with_longer_body.errors[:body]).to include 'は65535文字以内で入力してください'
  end
end
