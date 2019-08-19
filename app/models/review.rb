class Review < ApplicationRecord
  belongs_to :destination, dependent: :destroy
  validates :user_name, presence: true
  validates :rating, presence: true
  validates_inclusion_of :rating, in: 1..5
  validates :content, presence: true
  validates :destination_id, presence: true
end
