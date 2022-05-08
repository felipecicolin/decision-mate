# frozen_string_literal: true

Rails.application.routes.draw do
  get 'decision_mate/index'
  root "home#index"
end
