Rails.application.routes.draw do
  get 'timeline/index'
  devise_for :users
  root to: 'pages#home'
  resources :users, path: :u do
    resources :timelines, only: [:index], path: :timeline
  end
  resources :contracts
  resources :reminders, only: [:destroy]
  resources :meetups
end
