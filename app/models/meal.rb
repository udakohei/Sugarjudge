class Meal < ApplicationRecord
  belongs_to :user
  has_many :used_foods, dependent: :destroy
  has_many :foods, through: :used_foods

  mount_uploader :meal_image, MealImageUploader

  validates :meal_image, presence: true

  def calorie_intake
    sum = 0
    foods.each do |food|
      sum += food.calorie
    end
    sum
  end

  def balance_of_payments
    calorie_intake - user.required_calorie.round
  end

  def red?
    balance_of_payments > 0
  end

  def result
    if red?
      "カロリー赤字です"
    else
      "カロリー黒字です"
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
      "+#{balance_of_payments} kcal"
    else
      "#{balance_of_payments} kcal"
    end
  end

  def result_message
    if red?
      "赤字が増えすぎるとカロリー破産してしまいます。気をつけてください。"
    else
      "安定した黒字は確実にあなたの資産となります。"
    end
  end

  def result_meal_title
    if foods.length == 1
      "『#{foods.first.name}』"
    else
      "『#{foods.order(calorie: :desc).first.name}と諸々』"
    end
  end

  def pass_to_sql
    analyzed_foods.split(',')
  end
end
