class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :meals, dependent: :destroy
  has_many :comments, dependent: :destroy

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
    user.validates :password, confirmation: true, presence: true, length: { minimum: 3 }, if: lambda {
                                                                                                new_record? || changes[:crypted_password]
                                                                                              }
    user.validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  end

  def sugar_limit
    if male?
      (20 * limit_level_value + 40) / 3
    elsif high?
      50 / 3
    else
      (5 * (limit_level_value - 1) + 50) / 3
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

  def sum_sugar
    sugar = 0
    meals.with_result.each do |meal|
      sugar += meal.sugar_intake
    end
    sugar
  end

  def sum_limit
    meals.with_result.length * sugar_limit
  end

  def sum_balance_of_payments
    sum_sugar - sum_limit
  end

  def red?
    sum_balance_of_payments > 0
  end

  def result_color
    if red?
      'text-danger'
    else
      'text-dark'
    end
  end

  def result
    if red?
      '累計糖質赤字です'
    else
      '累計糖質黒字です'
    end
  end

  def sum_balance_of_payments_with_sign
    if red?
      "+#{sum_balance_of_payments} g"
    else
      "#{sum_balance_of_payments} g"
    end
  end
end
