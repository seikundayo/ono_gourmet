Rails.application.routes.draw do
  root to: "homes#index"
  resources :homes
  resources :cafes, only: [:index]
  resources :lunches, only: [:index]
  resources :dinners, only: [:index]
  resources :breads, only: [:index]
  resources :pubs, only: [:index]
  resources :takeouts, only: [:index]
  resources :shops, only: [:index,:show]
end
