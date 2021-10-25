Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/',            to: 'home#top'
  get '/home',        to: 'home#index'
  get '/login',       to: 'users#login_form'
  post '/login',      to: 'users#login'
  delete '/logout',   to: 'users#destroy'
  resources :users
  resources :events, only: [:index, :show]
  resources :spots, only: [:index, :show]
end
