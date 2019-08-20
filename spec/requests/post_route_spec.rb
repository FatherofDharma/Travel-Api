require 'rails_helper'

describe "post a destination route", :type => :request do

  before do
    post '/destinations', params: { :city => "portland", :country => "USA" }
  end

  it 'returns the city name' do
    expect(JSON.parse(response.body)['city']).to eq('portland')
  end

  it 'returns the country name' do
    expect(JSON.parse(response.body)['country']).to eq('USA')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end

end

describe "post a destination route with missing content", :type => :request do

  it 'returns correct error for empty city field' do
    post '/destinations', params: { :city => "", :country => "USA" }
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'returns correct error for empty country field' do
    post '/destinations', params: { :city => "portland", :country => "" }
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'returns correct error for empty fields' do
    post '/destinations', params: { :city => "", :country => "" }
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'returns correct error for empty fields' do
    post '/destinations', params: { :city => "portland", :country => "" }
    expect(JSON.parse(response.body)['message']).to eq("Validation failed: Country can't be blank")
  end

end
