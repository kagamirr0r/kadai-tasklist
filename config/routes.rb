Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'

root to: 'toppage#index'

get "signup", to: "user#new"
resources :users, only: [:index, :show, :new, :create]
resources :tasks
end
