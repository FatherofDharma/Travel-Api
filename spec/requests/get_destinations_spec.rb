require 'rails_helper'

describe "get all destinations route", :type => :request do
  Destination.destroy_all
  let!(:destinations) { FactoryBot.create_list(:destination, 20) }

  before { get '/destinations' }

  it 'returns all destinations' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end

describe "get specific destination by id route", :type => :request do

  it 'returns an error message for invalid id' do
    get '/destinations/0'
    expect(JSON.parse(response.body)['message']).to eq("Couldn't find Destination with 'id'=0")
  end

  it 'returns a destination with id' do
    destination = FactoryBot.create(:destination)
    get "/destinations/#{destination.id}"
    expect(JSON.parse(response.body)["id"]).to eq(destination.id)
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
