Rails.application.routes.draw do
  get '/', to: 'sessions#home'
  get '/auth/github/callback' => 'sessions#home'
  post '/login', to: 'sessions#login'
  post '/logout', to: 'sessions#logout'

  resources :medals, only: [:index, :show] do
    resources :users, only: [:index]
  end

  resources :beers do
    resources :reviews, only: [:index]
  end

  resources :reviews, only: [:index, :show]

  resources :users, only: [:show] do
    resources :medals, only: [:index, :show]
    resources :beers, only: [:show, :index]
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
