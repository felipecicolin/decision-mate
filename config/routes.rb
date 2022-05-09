# frozen_string_literal: true

Rails.application.routes.draw do
  get "products/index"
  get "options/index"
  root "home#index"
end
