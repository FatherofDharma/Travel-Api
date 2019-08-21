Rails.application.routes.draw do
  get '/most_reviewed_destinations/', to: 'v1/destinations#most_reviewed'

  # namespace: v2 do
  #   concerns :api_base
  # end

  namespace :v1 do
    resources :destinations do
      resources :reviews
    end
  end
end
