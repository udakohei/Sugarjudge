require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user is guest_user' do
    it 'is valid with name, gender, limit_level' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.role).to eq 'guest'
    end

    it 'is invalid without name' do
      user_without_name = build(:user, name: '')
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to include 'を入力してください'
    end

    it 'is invalid without gender' do
      user_without_gender = build(:user, gender: nil)
      expect(user_without_gender).to be_invalid
      expect(user_without_gender.errors[:gender]).to include 'を入力してください'
    end

    it 'is invalid without limit_level' do
      user_without_limit_level = build(:user, limit_level: nil)
      expect(user_without_limit_level).to be_invalid
      expect(user_without_limit_level.errors[:limit_level]).to include 'を入力してください'
    end

    it 'is invalid without role' do
      user_without_role = build(:user, role: nil)
      expect(user_without_role).to be_invalid
      expect(user_without_role.errors[:role]).to include 'を入力してください'
    end

    it 'is valid when name is shorter than 255' do
      user_with_shorter_name = build(:user, name: 'あ' * 254)
      expect(user_with_shorter_name).to be_valid
    end

    it 'is valid when name is 255' do
      user_with_255_name = build(:user, name: 'あ' * 255)
      expect(user_with_255_name).to be_valid
    end

    it 'is invalid when name is longer than 255' do
      user_with_longer_name = build(:user, name: 'あ' * 256)
      expect(user_with_longer_name).to be_invalid
      expect(user_with_longer_name.errors[:name]).to include 'は255文字以内で入力してください'
    end
  end

  context 'when user is login_user' do
    it 'is valid with name, gender, limit_level, email, password, password_confirmation' do
      login_user = build(:user, :login_user)
      expect(login_user).to be_valid
    end

    it 'is invalid without email' do
      login_user_without_email = build(:user, :login_user, email: '')
      expect(login_user_without_email).to be_invalid
      expect(login_user_without_email.errors[:email]).to include 'を入力してください'
    end

    it 'is invalid without password' do
      login_user_without_password = build(:user, :login_user, password: '')
      expect(login_user_without_password).to be_invalid
      expect(login_user_without_password.errors[:password]).to include 'を入力してください'
    end

    it 'is invalid without password_confirmation' do
      login_user_without_password_confirmation = build(:user, :login_user, password_confirmation: '')
      expect(login_user_without_password_confirmation).to be_invalid
      expect(login_user_without_password_confirmation.errors[:password_confirmation]).to include 'を入力してください'
    end

    it 'is valid with unique email' do
      login_user = create(:user, :login_user)
      login_user_with_unique_email = build(:user, :login_user, email: 'other@example.com')
      expect(login_user_with_unique_email).to be_valid
    end

    it 'is invalid with duplicate email' do
      login_user = create(:user, :login_user)
      login_user_with_duplicate_email = build(:user, :login_user, email: login_user.email)
      expect(login_user_with_duplicate_email).to be_invalid
      expect(login_user_with_duplicate_email.errors[:email]).to include 'はすでに存在します'
    end

    it 'is invalid with different password_confirmation from password' do
      login_user_with_different_password_confirmation = build(:user, :login_user, password_confirmation: 'other password')
      expect(login_user_with_different_password_confirmation).to be_invalid
      expect(login_user_with_different_password_confirmation.errors[:password_confirmation]).to include 'とパスワードの入力が一致しません'
    end

    it 'is invalid when password is shorter than 3' do
      login_user_with_shorter_password = build(:user, :login_user, password: 'a' * 2, password_confirmation: 'a' * 2)
      expect(login_user_with_shorter_password).to be_invalid
      expect(login_user_with_shorter_password.errors[:password]).to include 'は3文字以上で入力してください'
    end

    it 'is valid when password is 3' do
      login_user_with_3_password = build(:user, :login_user, password: 'a' * 3, password_confirmation: 'a' * 3)
      expect(login_user_with_3_password).to be_valid
    end

    it 'is valid when password is longer than 3' do
      login_user_with_longer_password = build(:user, :login_user, password: 'a' * 4, password_confirmation: 'a' * 4)
      expect(login_user_with_longer_password).to be_valid
    end
  end
end
