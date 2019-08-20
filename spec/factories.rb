require 'rails_helper'

FactoryBot.define do
  factory :destination do
    city { 'Vancouver' }
    country { 'USA' }
  end
end
