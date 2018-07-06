Rails.application.routes.draw do

  get 'home/show'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'donor_home', to: "donors#donor_home", as: "donor_interface"
  get 'highest_donor', to: "donors#highest_donor", as: "highest_donor"



  resources :sessions, only: [:new, :create, :destroy]
  resource :home, only: [:show]
  root to: "home#show"

  resources :donors, only: [:new, :create]
  resources :recipients


  resources :categories do
    resources :recipients 
  end

  get "/total_user_donations", to: "categories#total_user_donation", as: "categories/total_user_donation"
  get "/recipients/:id/next", to: "recipients#next"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
