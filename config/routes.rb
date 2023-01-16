# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#show'
  resources :topics
  resources :questions
  resources :answers

  resources :followings
  # resources :products do
  #   resources :comments, except: %i[new show]
  # end
  # resource :carts, only: [:show]
  # resources :order_items
  # namespace :paypal do
  #   resources :checkouts, only: [:create] do
  #     collection do
  #       get :complete
  #     end
  #   end
  # end
  # # get '*path' => redirect('/')

  # namespace :api do
  #   namespace :v1 do
  #     resources :products
  #   end
  # end
end
