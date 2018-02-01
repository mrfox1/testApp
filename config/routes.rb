Rails.application.routes.draw do
  get 'sessions/logout'

  get 'sessions/login'

  post 'sessions' => 'sessions#create'

  resources :posts do
    resources :comments
  end
  get 'pages/index'
  root 'pages#index'
  get 'registration' => 'users#new', as: 'registration'
  post 'users' => 'users#create'
  get	'like' =>	'posts#like'
  get 'dislike' => 'posts#dislike'
  get 'best' => 'posts#best'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
