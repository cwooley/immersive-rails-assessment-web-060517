Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests, only: [:index, :show]
  resources :episodes, only: [:index, :show]
  resources :users, only: [:new, :create, :destroy]
  get '/appearances/new', to: 'appearances#new'
  post '/appearances', to: 'appearances#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
end
