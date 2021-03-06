Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :photos, only: [:index, :new, :create, :destroy]
  end
  resources :profiles, only: [:show, :edit, :update]
  resources :tools, only: [:index, :new, :create, :show, :search] do
    resources :reviews, only: [:new]
    collection do
      get 'autocomplete_tool_name'
      get 'search'
    end
  end
  resources :reviews, except: [:new] do
    resources :comments, except: [:index, :new, :show]
    resources :likes, only: [:create, :destroy]
  end
  resources :comments, only: [:index]
  resources :likes, only: [:index]
  resources :photos_ranking, only: [:index]
  resources :users_reviews_number_ranking, only: [:index]
  resources :users_reviews_sum_likes_count_ranking, only: [:index]
  resources :users_created_at_ascend, only: [:index]
  resources :users_created_at_descend, only: [:index]
  resources :tools_reviews_number_ranking, only: [:index]
  resources :tools_all, only: [:index]
  root 'users#index'
end
