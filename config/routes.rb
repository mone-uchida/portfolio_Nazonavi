Rails.application.routes.draw do
  get '/',  to: 'home#top'
  get '/home', to: 'home#index'
  get '/login', to: 'users#login'
  resources :users
end
