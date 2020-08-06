Rails.application.routes.draw do
  devise_for :users
  root to: "topics#index"
  resources :topics do
    resource :likes, only: [:create, :destroy, :show]
  end
  resources :cafes, only: [:index]
  resources :lunches, only: [:index]
  resources :dinners, only: [:index]
  resources :breads, only: [:index]
  resources :pubs, only: [:index]
  resources :takeouts, only: [:index]
  resources :shops, only: [:index,:show]
  resources :like_lists, only: [:index]
end
