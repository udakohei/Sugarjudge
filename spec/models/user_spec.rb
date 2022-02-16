require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, gender, limit_level" do
    user = build(:user)
    expect(user).to be_valid
    expect(user.role).to eq 'guest'
  end

  it "is invalid without name" do
    user_without_name = build(:user, name: '')
    expect(user_without_name).to be_invalid
    expect(user_without_name.errors[:name]).to eq ['を入力してください']
  end

  it "is invalid without gender" do
    user_without_gender = build(:user, gender: nil)
    expect(user_without_gender).to be_invalid
    expect(user_without_gender.errors[:gender]).to eq ['を入力してください']
  end

  it "is invalid without limit_level" do
    user_without_limit_level = build(:user, limit_level: nil)
    expect(user_without_limit_level).to be_invalid
    expect(user_without_limit_level.errors[:limit_level]).to eq ['を入力してください']
  end

  it "is invalid without role" do
    user_without_role = build(:user, role: nil)
    expect(user_without_role).to be_invalid
    expect(user_without_role.errors[:role]).to eq ['を入力してください']
  end
end
