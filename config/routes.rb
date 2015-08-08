Rails.application.routes.draw do
  


  get 'posts/index'

  get 'posts/new'

  get 'posts/create'

  get 'posts/show'

  get 'posts/edit'

  get 'posts/update'

  get 'posts/destroy'

  get '/sign_up', to: 'users#new', as: :sign_up

resources :users
resources :sessions, only: [:new, :create, :destroy]
resources :posts
end
