Rails.application.routes.draw do

  devise_for :users
  root "static_pages#index"

  get 'generate_reports', to: 'static_pages#generate_reports'

  resources :requests, only: [:new, :create, :show]
  resource :dashboard, only: [:show]

  namespace :staff do
    resources :requests, only: [:edit, :update, :index]
    resources :users, only: [:show, :index]
  end

end
