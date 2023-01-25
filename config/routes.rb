# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#show'
  resources :homes, only: [:show] do
    get :about # member route
    get :profile # member route
  end
  resources :topics, only: %i[index show new create]
  resources :questions, only: %i[index show new create] do
    patch :dislike   # member route
    patch :like      # member route
  end
  resources :answers, only: [:create] do
    patch :dislike   # member route
    patch :like      # member route
  end
  resources :followings, only: %i[create destroy]
  get '*path' => redirect('/')
end
