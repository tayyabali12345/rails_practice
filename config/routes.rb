# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#show'
  resources :homes, only: [:show] do
    get :about
    get :profile
  end
  resources :topics, except: %i[edit update destroy]
  resources :questions, except: %i[edit update destroy] do
    patch :dislike_question
    patch :like_question
  end
  resources :answers, only: [:create] do
    patch :dislike_answer
    patch :like_answer
  end
  resources :followings, only: %i[create destroy]
  get '*path' => redirect('/')
end
