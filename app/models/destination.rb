class Destination < ApplicationRecord
  has_many :reviews
  validates :city, presence: true
  validates :country, presence: true
end
