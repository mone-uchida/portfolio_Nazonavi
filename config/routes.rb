Rails.application.routes.draw do
  get 'events/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/',         to: 'home#top'
  get '/home',     to: 'home#index'
  get '/login',    to: 'users#login_form'
  post '/login',   to: 'users#login'
  post '/logout',  to: 'users#logout'
  resources :users
  resources :events
end
