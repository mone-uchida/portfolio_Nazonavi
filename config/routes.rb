Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/',                to: 'home#top'
  get '/home',            to: 'home#index'
  get '/introduction',    to: 'home#introduction'
  get '/users/:id/posts', to: 'users#posts_index', as: 'users_posts_index'
  get '/login',           to: 'users#login_form'
  post '/login',          to: 'users#login'
  delete '/logout',       to: 'users#destroy'
  get 'search',           to: 'events#search'
  get 'address',          to: 'events#address_search'
  get 'tag/:id',         to: 'events#tag_search'
  post '/search/:id',     to: 'posts#event_search', as: 'event_search'
  post 'favorite/:id',    to: 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id',  to: 'favorites#destroy', as: 'destroy_favorite'
  resources :users do
    resources :favorites, only: [:index]
  end
  resources :posts
  resources :events, only: [:index, :show]
  resources :spots, only: [:show]
end
