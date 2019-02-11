Rails.application.routes.draw do
  get '/', to: 'application#home'
  post '/login', to: 'application#login'
  get '/logout' => 'application#logout'

  resources :medals, only: [:index, :show] do
    resources :users, only: [:index]
  end

  resources :beers

  resources :reviews

  resources :users do
    resources :medals, only: [:index]
    resources :beers
    resources :sessions
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
