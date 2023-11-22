class Review < ApplicationRecord
  # A review must belong to a restaurant.
  belongs_to :restaurant

  # A review must have a content.
  validates :content, presence: true

  # A review must have a rating.
  validates :rating, presence: true

  # A review’s rating must be a number between 0 and 5.
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }

  # A review’s rating must be an integer. For example, a review with a rating of 2.5 should be invalid!
  validates :rating, numericality: { only_integer: true }
end
