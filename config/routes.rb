Rails.application.routes.draw do
  devise_for :users
  resources :destinations do
    resources :reviews
  end

  root 'home#index'
  # root 'devise/sessions#new'
  # devise_scope :user do get "/" => "devise/sessions#new" end
  get '/most_reviewed_destinations/', to: 'destinations#most_reviewed'
end
