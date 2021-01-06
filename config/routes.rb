Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :posts do
    resources :likes
  end
  root to: 'home#index'

  resources  :users do
    resources :posts, only: [:index]
  end
  get 'users/:id/user_posts' => 'users#user_posts', :as => :custom_user_posts

  mount Commontator::Engine => '/commontator'

  get 'friends/requests' => 'friends#requests', :as => :friend_requests

  get 'friends/accept/:id' => 'friends#accept', :as => :accept_request

end
