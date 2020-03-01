Rails.application.routes.draw do
  devise_for :users

  root to: 'projects#index'
  resources :projects do
    resources :add_project_member, only: %w[new create destroy]
    resources :missions, only: %w[show new create edit update destroy] do
      resources :topics, only: %w[new create edit update destroy] do
        resources :messages
      end
    end
  end
  resources :users, only: %w[show update destroy]

end
