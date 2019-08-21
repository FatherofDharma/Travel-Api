require 'rails_helper'

describe "get all destinations route", :type => :request do
  Destination.destroy_all
  let!(:destinations) { FactoryBot.create_list(:destination, 20) }

  before { get '/v1/destinations' }

  it 'returns all destinations' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end

describe "get specific destination by id route", :type => :request do

  it 'returns an error message for invalid id' do
    get '/v1/destinations/0'
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find Destination with 'id'=0")
  end

  it 'returns a destination with id' do
    destination = FactoryBot.create(:destination)
    get "/v1/destinations/#{destination.id}"
    expect(JSON.parse(response.body)["id"]).to eq(destination.id)
  end

  it 'returns a destination with the given city' do
    FactoryBot.create(:destination, :city => "seattle")
    destination2 = FactoryBot.create(:destination, :city => "portland")
    get "/v1/destinations", params: { :city => "portland" }
    expect(JSON.parse(response.body)[0]["city"]).to eq(destination2.city)
  end

  it 'returns a destination with the given country' do
    FactoryBot.create(:destination, :country => "Turkey")
    destination2 = FactoryBot.create(:destination, :country => "USA")
    get "/v1/destinations", params: { :country => "USA" }
    expect(JSON.parse(response.body)[0]["country"]).to eq(destination2.country)
  end

  it 'returns a destination with the given city and country' do
    FactoryBot.create(:destination, :city => "metropolis", :country => "Turkey")
    destination2 = FactoryBot.create(:destination, :city => "metropolis", :country => "USA")
    get "/v1/destinations", params: { :city => "metropolis", :country => "USA" }
    expect(JSON.parse(response.body)[0]["country"]).to eq(destination2.country)
    expect(JSON.parse(response.body)[0]["city"]).to eq(destination2.city)
  end

end

describe "get most reviewed destinations route", :type => :request do
  # let!(:destinations) { FactoryBot.create_list(:destination, 20)}

  # FactoryBot.c reate(:review, destination_id: destination1.id)

  it 'returns most reviewed destinations in descending order' do
    destinations = FactoryBot.create_list(:destination, 20)
    destination0 = destinations[0]
    FactoryBot.create_list(:review, 10, destination: destination0)
    get '/most_reviewed_destinations'
    expect(JSON.parse(response.body)[0]["id"]).to eq(destination0.id)
  end
end
