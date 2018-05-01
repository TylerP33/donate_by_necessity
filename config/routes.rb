Rails.application.routes.draw do

  get 'home/show'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/session', to: 'sessions#create', as: 'session'
  get '/signup', to: 'donors#new', as: 'signup'
  post '/donor', to: 'donors#create', as: "donor"
  get '/welcome_donor', to: 'donors#index', as: "welcome_donor"


  resources :sessions, only: [:new, :create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

  resources :donors, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
