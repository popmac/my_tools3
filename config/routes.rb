Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :photos
  end
  resources :profiles
  resources :tools do
    collection do
      get 'autocomplete_tool_name'
    end
  end
  resources :reviews
  root 'users#index'
end
