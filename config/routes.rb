# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :posts do
    resources :likes
    resources :comments
  end

  resources :comments do
    member do
      put 'like' => 'comments#like'
    end
  end
  root to: 'home#index'

  resources :users do
    resources :posts, only: [:index]
  end
  get 'users/:id/user_posts' => 'users#user_posts', :as => :custom_user_posts

  get 'friends/requests' => 'friends#requests', :as => :friend_requests

  get 'friends/add/:id' => 'friends#add', :as => :add_friend

  get 'friends/accept/:id' => 'friends#accept', :as => :accept_request

  get 'friends/decline/:id' => 'friends#decline', :as => :decline_request

  get 'friends/:id/list' => 'friends#list', :as => :friends_list
end
