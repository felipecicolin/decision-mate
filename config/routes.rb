# frozen_string_literal: true

Rails.application.routes.draw do
  get "decisions/costumer_attributes"
  get "decisions/product_options"
  root "home#index"
end
