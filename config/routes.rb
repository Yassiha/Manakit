Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :projects
  resources :users, only: %w[show update destroy]

end
