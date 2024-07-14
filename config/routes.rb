Rails.application.routes.draw do
  root "home#index"
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get 'signup', to: 'users#new'  # Exibir o formulário de cadastro
  post 'signup', to: 'users#create'  # Processar o cadastro

  get 'signin', to: 'sessions#new'  # Exibir o formulário de login
  post 'signin', to: 'sessions#create'  # Processar o login
  delete 'logout', to: 'sessions#destroy'  # Processar logout
  

  get 'info', to: 'users#info', as: :info
  get 'show', to: 'users#show', as: :show
end
