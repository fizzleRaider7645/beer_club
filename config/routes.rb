Rails.application.routes.draw do
  get '/', to: 'sessions#home'
  post '/login', to: 'sessions#login'
  post '/logout', to: 'sessions#logout'

  resources :medals, only: [:index, :show] do
    resources :users, only: [:index]
  end

  resources :beers, only: [:index, :show]

  resources :reviews

  resources :users do
    resources :medals, only: [:index, :show]
    resources :beers
    resources :sessions
    resources :reviews
  end

  namespace :admin do
    resources :beers, only: [:index, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
