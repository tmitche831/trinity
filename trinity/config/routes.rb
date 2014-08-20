Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users
  resources :bookings
  resources :houses
  get '/user_login' => 'sessions#new'
  post '/user_login' => 'sessions#create'
  delete '/user_login' => 'sessions#destroy'
end
