class Destination < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :city, presence: true
  validates :country, presence: true
end
