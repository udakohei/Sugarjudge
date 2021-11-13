class User < ApplicationRecord
  enum gender: { male: 0, female: 1 }
  enum physical_activity_level: { low: 0, normal: 1, high: 2 }

  validates :name, presence: true, length: { maximum: 255 }
  validates :gender, presence: true
  validates :age, presence: true
  validates :physical_activity_level, presence: true
end
