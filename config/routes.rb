Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  resources :posts
  root 'posts#index'
end