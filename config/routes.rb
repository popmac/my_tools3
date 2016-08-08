Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :photos
  end
  resources :profiles
  resources :tools do
    resources :reviews, only: [:new]
    collection do
      get 'autocomplete_tool_name'
    end
  end
  resources :reviews, except: [:new] do
    resources :comments
  end
  root 'users#index'
end
