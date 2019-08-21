require 'rails_helper'

describe "put destination route" do

  it 'will update a destination' do
    destination = FactoryBot.create(:destination)
    put "/v1/destinations/#{destination.id}", params: {:city => 'seattle', :country => "turkey"}
    # binding.pry
    expect(JSON.parse(response.body)["message"]).to eq("This destination has been updated successfully!")
    expect(response).to have_http_status(:success)
    updated_destination = Destination.find(destination.id)
    expect(updated_destination.country).to eq("turkey")
    expect(updated_destination.city).to eq("seattle")
  end
end

# it 'returns a destination with id' do
#   destination = FactoryBot.create(:destination)
#   get "/destinations/#{destination.id}"
#   expect(JSON.parse(response.body)["id"]).to eq(destination.id)
# end
