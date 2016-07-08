Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :profiles
  root 'users#index'
end
