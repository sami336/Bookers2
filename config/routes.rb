Rails.application.routes.draw do

  root to: "homes#top"
  get 'home/about', to: 'homes#about', as: 'about'
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get "search" => 'searches'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
