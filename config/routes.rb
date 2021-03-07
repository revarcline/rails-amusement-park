Rails.application.routes.draw do
  root 'static#home'
  get '/signin', to: 'session#new', as: 'signin'
  delete '/session', to: 'session#destroy'
  post '/rides', to: 'rides#create', as: 'rides'
  resources :users
  resources :attractions
  resources :session, only: %i[create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
