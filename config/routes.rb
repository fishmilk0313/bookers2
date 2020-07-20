Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/index' => 'homes#index'
  get 'home/about' => 'homes#about'
  get 'users/mypage' => 'users#index'

  resources :books, only: [:edit, :create, :update, :index, :show, :destroy]
  resources :users, only: [:show, :index, :create, :update, :edit]

end
