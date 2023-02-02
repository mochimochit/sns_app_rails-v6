Rails.application.routes.draw do
  devise_for :devise_users
  # resources :users
  # resources :posts
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "users/new" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get 'login' => 'users#login'
  post "login" => "users#login"

  get 'users/index'
  get 'posts' => 'posts#post'
  get 'posts/postslist' => 'posts#postslist'
  get 'posts/:id/edit' => 'posts#edit'
  get '/' => 'home#top'
  get 'home/profile' => 'home#profile'
  get 'posts/:id' => 'posts#show'

  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
