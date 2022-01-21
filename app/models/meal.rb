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
    sugar_intake - user.sugar_limit.round
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
      "残念です・・・あなたの食事は糖質赤字です。赤字が増えすぎるとあなたの身体の資産は減り続け、糖質破産をしてしまいます。一刻も早く収支を黒字化させてください。ちなみに#{highest_sugar_food.name}を#{highest_sugar_food.genre.lowest_sugar_food.name}に変えると
        #{highest_sugar_food.sugar - highest_sugar_food.genre.lowest_sugar_food.sugar}g黒字化されます。#{eliminate_red}"
    else
      "おめでとうございます！！あなたの食事は糖質黒字です。安定した黒字は確実に富としてあなたの資産となります。このまま継続させましょう。ちなみに#{highest_sugar_food.name}を#{highest_sugar_food.genre.lowest_sugar_food.name}に変えると
      #{highest_sugar_food.sugar - highest_sugar_food.genre.lowest_sugar_food.sugar}g黒字化されます。#{eliminate_red}"
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

  def highest_sugar_food
    foods.order(sugar: :desc).first
  end

  def used_foods_list
    foods.map{ |food| food.name }.join('と')
  end

  def eliminate_red
    if balance_of_payments > 0 && balance_of_payments <= 15
      "また、歌うことができるくらいの強度で運動すれば赤字が帳消しされます。ヨガやウォーキングをしましょう。"
    elsif balance_of_payments > 15 && balance_of_payments <= 35
      "また、会話はできるが歌うのは難しいくらいの強度で運動すれば赤字が帳消しされます。長めのジョギングをしましょう。"
    elsif balance_of_payments > 35 && balance_of_payments <= 45
      "また、短い時間、会話できないくらい運動すれば赤字が帳消しされます。ダッシュなど短距離走をしましょう。"
    elsif balance_of_payments > 45 && balance_of_payments <= 75
      "また、長時間、会話できないくらい運動すれば赤字が帳消しされます。マラソンなど長距離走をしましょう。"
    elsif balance_of_payments > 75
      "破産するしか道はなさそうです。"
    else
      "食事以外であなたは自由です！好きなことをしてください！"
    end
  end
end
