Rails.application.routes.draw do
  devise_for :admins, controllers: {   registrations: 'admins/registrations',
                                    sessions: 'admins/sessions' }
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users, only:[:index]
  root to: "topics#index"
  resources :topics do
    resource :likes, only: [:create, :destroy, :show]
  end
  resources :topics do
    resource :admin_likes, only: [:create, :destroy, :show]
  end
  resources :shops do
    resource :follow_relationships, only: [:create, :destroy, :show]
  end
  resources :manager_topics
  resources :cafes, only: [:index]
  resources :lunches, only: [:index]
  resources :dinners, only: [:index]
  resources :breads, only: [:index]
  resources :pubs, only: [:index]
  resources :takeouts, only: [:index]
  resources :shops
  resources :like_lists, only: [:index]
  resources :follow_lists, only: [:index]
  resources :contacts, only: [:new, :create]
  resources :abouts, only: [:index]
  resources :administrators, only: [:index]
  resources :policies, only: [:index]
  resources :managements, only: [:index]
end
