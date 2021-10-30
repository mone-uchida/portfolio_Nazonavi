Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/',                to: 'home#top'
  get '/home',            to: 'home#index'
  get '/login',           to: 'users#login_form'
  post '/login',          to: 'users#login'
  delete '/logout',       to: 'users#destroy'
  post 'favorite/:id',    to: 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id',  to: 'favorites#destroy', as: 'destroy_favorite'
  resources :users do
    resources :favorites, only: [:index]
    resources :posts, only: [:index]
  end
  resources :posts
  resources :events, only: [:index, :show]
  resources :spots, only: [:index, :show]
end
