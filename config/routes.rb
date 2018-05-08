Rails.application.routes.draw do

  get 'home/show'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'donor_home', to: "donors#donor_home", as: "donor_interface"



  resources :sessions, only: [:new, :create, :destroy]
  resource :home, only: [:show]
  root to: "home#show"

  resources :donors
  resources :categories
  resources :recipients, param: :last_name


  resources :categories do
    resources :recipients
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
