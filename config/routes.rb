Rails.application.routes.draw do
  get '/login', to: 'application#home'
  post '/login', to: 'application#login'
  get '/logout' => 'application#logout'
  resources :medals
  resources :sessions
  resources :beers
  resources :users do
    resources :beers, only: [:new, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
