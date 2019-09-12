Rails.application.routes.draw do

  devise_for :users
  root "static_pages#index"

  resources :requests, only: [:new, :create, :show]

  namespace :staff do
    resources :requests, only: [:edit, :update, :index]
  end

end
