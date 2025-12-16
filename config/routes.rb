Rails.application.routes.draw do
  get 'tasting_logs/index'
  get 'tasting_logs/new'
  get 'tasting_logs/show'
  devise_for :users

  root "pages#home"

  resources :beverages, only: %i[index show] do
    resource :favorite, only: %i[create]
  end

  resources :tasting_logs, only: %i[index new create show destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end

