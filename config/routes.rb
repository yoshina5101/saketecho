Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  get "mypage", to: "pages#mypage"

  resources :beverages, only: %i[index show] do
    resource :favorite, only: %i[create destroy]
  end

  resources :tasting_logs, only: %i[index new create show destroy]
  resources :favorites, only: %i[index]

  get "up" => "rails/health#show", as: :rails_health_check
end

