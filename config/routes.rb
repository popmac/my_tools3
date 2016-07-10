Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :profiles
  resources :photos
  root 'users#index'
end
