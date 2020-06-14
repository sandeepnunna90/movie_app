# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :length, :description, :rating, presence: true
  validate :acceptable_image

  def self.search(query)
    where('lower(title) like ?', "%#{query.downcase}%")
  end

  def average_score
    scores = reviews.map(&:score)
    (scores.sum.to_f / scores.size).round(1)
  end

  private

  def acceptable_image
    errors.add(:image, 'is missing!') unless image.attached?
    acceptable_types = ['image/jpeg', 'image/png']
    if image.attached?
      errors.add(:image, 'is too big') if image.byte_size >= 1.megabyte
      unless acceptable_types.include?(image.content_type)
        errors.add(:image, 'must be a JPEG or PNG')
      end
    end
  end
end
