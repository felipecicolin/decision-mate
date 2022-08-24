# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_decisions, only: [:index, :new, :create]

  root to: "home#index"

  get "about/index"
end
