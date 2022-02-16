require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, gender, limit_level" do
    user = User.new(
      name: 'テスト太郎',
      gender: :male,
      limit_level: :low,
    )
    expect(user).to be_valid
    expect(user.role).to eq 'guest'
  end

  it "is invalid without name" do
    user = User.new(
      name: nil,
      gender: :male,
      limit_level: :low,
    )
    expect(user).to be_invalid
    expect(user.errors[:name]).to eq ['を入力してください']
  end

  it "is invalid without gender" do
    user = User.new(
      name: 'テスト太郎',
      gender: nil,
      limit_level: :low,
    )
    expect(user).to be_invalid
    expect(user.errors[:gender]).to eq ['を入力してください']
  end

  it "is invalid without limit_level" do
    user = User.new(
      name: 'テスト太郎',
      gender: :male,
      limit_level: nil,
    )
    expect(user).to be_invalid
    expect(user.errors[:limit_level]).to eq ['を入力してください']
  end

  it "is invalid without role" do
    user = User.new(
      name: 'テスト太郎',
      gender: :male,
      limit_level: :low,
      role: nil
    )
    expect(user).to be_invalid
    expect(user.errors[:role]).to eq ['を入力してください']
  end
end
