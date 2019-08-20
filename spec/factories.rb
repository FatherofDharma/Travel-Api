require 'rails_helper'

FactoryBot.define do
  factory :destination do
    city { 'Vancouver' }
    country { 'USA' }
  end
  factory :review do
    user_name { 'Bob' }
    rating { 3 }
    content { 'This place is great!' }
    destination_id { 1 }
  end
end
