Rails.application.routes.draw do
  

  root "site#home"

  get '/sign_up', to: 'users#new', as: :sign_up
  get '/profile', to: 'users#show', as: :profile
  get '/login', to: 'sessions#new', as: :new_login
  post '/login', to: 'sessions#create', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
resources :users, only: [:create, :edit, :update, :destroy]
resources :sessions, only: [:create]
resources :posts
end

  