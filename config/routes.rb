Rails.application.routes.draw do
  devise_for :users
  root to: "topics#index"
  resources :topics do
    resource :likes, only: [:create, :destroy, :show]
  end
  resources :managers, only: [:new, :create,:destroy,:update,:edit]
  resources :manager_topics
  resources :cafes, only: [:index]
  resources :lunches, only: [:index]
  resources :dinners, only: [:index]
  resources :breads, only: [:index]
  resources :pubs, only: [:index]
  resources :takeouts, only: [:index]
  resources :shops
  resources :like_lists, only: [:index]
  resources :contacts, only: [:new, :create]
  resources :abouts, only: [:index]
  resources :administrators, only: [:index]
  resources :policies, only: [:index]
  resources :managements, only: [:index]
  resources :pro_users, only: [:index]
end
