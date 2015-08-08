Rails.application.routes.draw do
  

  root "site#home"

  get '/sign_up', to: 'users#new', as: :sign_up
  get '/login', to: 'sessions#new', as: :new_login
  get '/login', to: 'sessions#create', as: :login
resources :users
resources :sessions, only: [:new, :create, :destroy]
resources :posts
end
