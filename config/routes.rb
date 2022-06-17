# frozen_string_literal: true
Rails.application.routes.draw do
  namespace :api do
    post 'sign_in' => 'sessions#create'
    resources :notes
    resources :accounts
  end
end