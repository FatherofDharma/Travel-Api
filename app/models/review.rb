class Review < ApplicationRecord
  belongs_to :review, dependent: :destroy
end
