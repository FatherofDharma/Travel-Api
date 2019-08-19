Rails.application.routes.draw do
  resources :destinations do
    resources :reviews
  end

  get '/most_reviewed_destinations/', to: 'destinations#most_reviewed'
end
