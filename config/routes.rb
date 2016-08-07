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
  resources :reviews do
    resources :comments
  end
  root 'users#index'
end
