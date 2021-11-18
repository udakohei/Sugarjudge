class User < ApplicationRecord
  has_many :meals, dependent: :destroy

  enum gender: { male: 0, female: 1 }
  enum physical_activity_level: { low: 0, normal: 1, high: 2 }

  validates :name, presence: true, length: { maximum: 255 }
  validates :gender, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 130 }
  validates :physical_activity_level, presence: true

  def required_calorie
    if male? && low?
      if age >= 18 && age <= 49
        766
      elsif age >= 50 && age <= 64
        733
      elsif age >= 65 && age <= 74
        683
      elsif age >= 75
        600
      end
    elsif male? && normal?
      if age >= 18 && age <= 29
        883
      elsif age >= 30 && age <= 49
        900
      elsif age >= 50 && age <= 64
        886
      elsif age >= 65 && age <= 74
        800
      elsif age >= 75
        700
      end
    elsif male? && high?
      if age >= 18 && age <= 49
        1016
      elsif age >= 50 && age <= 64
        983
      elsif age >= 65
        916
      end
    elsif female? && low?
      if age >= 18 && age <= 29
        566
      elsif age >= 30 && age <= 49
        583
      elsif age >= 50 && age <= 64
        550
      elsif age >= 65 && age <= 74
        516
      elsif age >= 75
        466
      end
    elsif female? && normal?
      if age >= 18 && age <= 29
        666
      elsif age >= 30 && age <= 49
        683
      elsif age >= 50 && age <= 64
        650
      elsif age >= 65 && age <= 74
        616
      elsif age >= 75
        550
      end
    elsif female? && high?
      if age >= 18 && age <= 29
        766
      elsif age >= 30 && age <= 49
        783
      elsif age >= 50 && age <= 64
        750
      elsif age >= 65
        700
      end
    end
  end
end
