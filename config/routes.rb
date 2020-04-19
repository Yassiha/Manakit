Rails.application.routes.draw do
  devise_for :users

  root to: 'projects#index'
  resources :projects do
    resources :add_project_member, only: %w[new create destroy]
    resources :missions, only: %w[show new create edit update destroy] do
      resources :tasks, only: %w[show new create edit update destroy]
      resources :topics, only: %w[show new create edit update destroy] do
        resources :messages
      end
    end
  end
  resources :users, only: %w[show update destroy]
  resources :dashboard, only: %w[show]

end
