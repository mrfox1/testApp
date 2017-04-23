Rails.application.routes.draw do
  get 'sessions/logout'

  get 'sessions/login'

  post 'sessions' => 'sessions#create'

  resources :posts
  get 'pages/index'
  root 'pages#index'
  get 'registration' => 'users#new', as: 'registration'
  post 'users' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
