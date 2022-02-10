class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :meals, dependent: :destroy

  enum gender: { male: 0, female: 1 }
  enum limit_level: { low: 0, normal: 1, high: 2 }
  enum role: { guest: 0, login: 1, admin: 2 }

  validates :name, presence: true, length: { maximum: 255 }
  validates :gender, presence: true
  validates :limit_level, presence: true
  validates :role, presence: true

  validates :password, confirmation: true

  with_options unless: :guest? do |user|
    user.validates :email, uniqueness: true, presence: true
    user.validates :password, confirmation: true, presence: true, length: {minimum: 3}, if: -> { new_record? || changes[:crypted_password] }
    user.validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  end

  def sugar_limit
    if male?
      (20 * limit_level_value + 40) / 3
    else
      if high?
        50 / 3
      else
        (5 * (limit_level_value - 1) + 50) / 3
      end
    end
  end

  def limit_level_value
    if low?
      3
    elsif normal?
      2
    else
      1
    end
  end

  def own?(object)
    id == object.user_id
  end
end
