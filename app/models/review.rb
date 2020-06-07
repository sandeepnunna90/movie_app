class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, presence: true
  validates :movie, presence: true
end
