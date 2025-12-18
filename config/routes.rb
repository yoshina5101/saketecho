Rails.application.routes.draw do
  get 'moods/index'
  get 'moods/show'
  devise_for :users

  root "pages#home"
  get "mypage", to: "pages#mypage"

  resources :beverages, only: %i[index show] do
    resource :favorite, only: %i[create destroy]
  end

  resources :tasting_logs, only: %i[index new create show edit update destroy]
  resources :favorites, only: %i[index]
  resources :moods, only: %i[index show]

  get "up" => "rails/health#show", as: :rails_health_check
end

