Rails.application.routes.draw do

  get 'home/show'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

  resources :recipients
  resources :donors only: [:new, :create]
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
