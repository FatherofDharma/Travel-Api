Rails.application.routes.draw do
  resources :destinations do
    resources :reviews
  end
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  root 'home#index'
  # root 'devise/sessions#new'
  # devise_scope :user do get "/" => "devise/sessions#new" end
  get '/most_reviewed_destinations/', to: 'destinations#most_reviewed'
end
