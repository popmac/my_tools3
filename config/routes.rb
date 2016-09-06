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
      get 'search'
    end
  end
  resources :reviews, except: [:new] do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :photos_ranking, only: [:index]
  resources :users_reviews_number_ranking, only: [:index]
  resources :users_reviews_sum_likes_count_ranking, only: [:index]
  resources :users_created_at_ascend, only: [:index]
  root 'users#index'
end
