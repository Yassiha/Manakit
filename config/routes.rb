Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :projects do
    resources :missions, only: %w[show new create edit update destroy]
  end
  resources :users, only: %w[show update destroy]

end
