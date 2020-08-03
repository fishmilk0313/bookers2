Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/index' => 'homes#index'
  get 'home/about' => 'homes#about'
  get 'users/mypage' => 'users#index'

  resources :users, only: [:show, :index, :create, :update, :edit] do
  	member do
  		get :following, :followers
  	end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books, only: [:edit, :create, :update, :index, :show, :destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]

 end

end
