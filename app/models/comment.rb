class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :body, presence: true, length: { maximum: 65_535 }
end
