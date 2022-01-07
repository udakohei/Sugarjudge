class User < ApplicationRecord
  has_many :meals, dependent: :destroy

  enum gender: { male: 0, female: 1 }
  enum limit_level: { low: 0, normal: 1, high: 2 }

  validates :name, presence: true, length: { maximum: 255 }
  validates :gender, presence: true
  validates :limit_level, presence: true

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
