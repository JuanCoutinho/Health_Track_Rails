Rails.application.routes.draw do
  root "home#index"
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get 'signup', to: 'users#new'  
  post 'signup', to: 'users#create'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'  
  
  get 'info', to: 'users#info', as: :info
  get 'show', to: 'users#show', as: :show
end
