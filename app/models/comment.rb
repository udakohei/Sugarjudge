class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :body, length: { minimum: 1, maximum: 65_535 }
end
