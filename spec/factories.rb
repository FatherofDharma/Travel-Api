require 'rails_helper'

FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { '123456' }
  end
end
