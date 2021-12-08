class Meal < ApplicationRecord
  belongs_to :user
  has_many :used_foods, dependent: :destroy
  has_many :foods, through: :used_foods

  mount_uploader :meal_image, MealImageUploader

  validates :meal_image, presence: true

  scope :with_result, -> { where.not(balance_of_payments: nil) }

  def sugar_intake
    sum = 0
    foods.each do |food|
      sum += food.sugar
    end
    sum
  end

  def balance_of_payments_value
    sugar_intake - user.required_sugar.round
  end

  def red?
    balance_of_payments > 0
  end

  def result
    if red?
      "糖質赤字です"
    else
      "糖質黒字です"
    end
  end

  def result_color
    if red?
      'text-danger'
    else
      'text-dark'
    end
  end

  def balance_of_payments_with_sign
    if red?
      "+#{balance_of_payments} g"
    else
      "#{balance_of_payments} g"
    end
  end

  def result_message
    if red?
      "赤字が増えすぎると糖質破産してしまいます。気をつけてください。"
    else
      "安定した黒字は確実にあなたの資産となります。"
    end
  end

  def result_meal_title
    if foods.length == 1
      "『#{foods.first.name}』"
    else
      "『#{foods.order(sugar: :desc).first.name}と諸々』"
    end
  end

  def pass_to_sql
    analyzed_foods.split(',')
  end
end
