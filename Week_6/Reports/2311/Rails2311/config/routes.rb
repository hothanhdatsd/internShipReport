# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    resources :products
    resources :posts
  end
  resources :employees
  root 'users#index'
end
