class Destination < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :city, presence: true
  validates :country, presence: true

  scope :city, -> (city) { where("city ILIKE ?", "%#{city}%")}
  scope :country, -> (country) { where("country ILIKE ?", "%#{country}%")}
  scope :review_count, -> {
    select("destinations.id, destinations.city, destinations.country, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("destinations.id")
    .order("reviews_count DESC")
  }
end
