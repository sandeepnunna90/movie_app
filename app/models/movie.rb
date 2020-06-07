class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :length, :description, :rating, presence: true

  has_attached_file :image, styles: { medium: "400x600#", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
