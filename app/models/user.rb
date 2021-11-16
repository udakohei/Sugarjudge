class User < ApplicationRecord
  enum gender: { male: 0, female: 1 }
  enum physical_activity_level: { low: 0, normal: 1, high: 2 }

  validates :name, presence: true, length: { maximum: 255 }
  validates :gender, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 130 }
  validates :physical_activity_level, presence: true
end
