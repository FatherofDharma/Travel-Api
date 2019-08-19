# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed

  def self.begin
    Destination.destroy_all
    Review.destroy_all
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    20.times do |i|
      destination = Destination.create!(
        city: Faker::Address.city,
        country: Faker::Movies::LordOfTheRings.location
      )
      puts "Destination #{i}: City is #{destination.city} and country is #{destination.country}."
      rand(3..7).times do |x|
        review = destination.reviews.create!(
          user_name: Faker::Movies::LordOfTheRings.character,
          rating: rand(1..5),
          content: Faker::Movies::Hobbit.quote
        )
        puts "Review #{x}: User is #{review.user_name}, Rating is #{review.rating}, and the content is #{review.content}."
      end
    end
  end
end

Seed.begin
