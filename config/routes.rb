# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login' => 'sessions#new', as: :login
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :sessions, only: %i[create destroy] do
    get :verify, on: :collection
  end
  root 'home#index'
end
