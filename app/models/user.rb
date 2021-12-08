class User < ApplicationRecord
  has_many :meals, dependent: :destroy

  enum gender: { male: 0, female: 1 }
  enum physical_activity_level: { low: 0, normal: 1, high: 2 }

  validates :name, presence: true, length: { maximum: 255 }
  validates :gender, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 130 }
  validates :physical_activity_level, presence: true

  def required_sugar
    if male?
      ((7.16 - 0.0138 * age - 0.4235) * 238 * physical_activity_level_value / 3) * 0.9
    else
      ((6.19 - 0.0138 * age - 0.9708) * 238 * physical_activity_level_value / 3) * 0.9
    end
  end

  def physical_activity_level_value
    if low?
      1.5
    elsif normal?
      1.75
    else
      2
    end
  end
end
