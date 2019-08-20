class Destination < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :city, presence: true
  validates :country, presence: true

  scope :find_by_city, -> (city) { where("city ILIKE ?", "%#{city}%")}
  # scope :city, -> (city) { where("city ILIKE %#{city}%")}

  scope :find_by_country, -> (country) { where("country ILIKE ?", "%#{country}%")}

  scope :find_by_city_country, -> (city, country) { where("city ILIKE ? AND country ILIKE ?", "%#{city}%", "%#{country}%")}

  scope :review_count, -> {
    select("destinations.id, destinations.city, destinations.country, count(reviews.id) AS reviews_count")
    .joins(:reviews)
    .group("destinations.id")
    .order("reviews_count DESC")
  }
end
