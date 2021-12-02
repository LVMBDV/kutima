# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => '/sidekiq'
  get 'health-check', to: 'health_check#check', as: :health_check

  get 'dashboard', to: 'dashboard#show', as: :dashboard

  resources :profiles, except: :destroy

  resources :identity_statements, path: 'identity-statements' do
    get 'new-reset', to: 'identity_statements#new_reset', as: :new_reset, on: :collection
  end

  get 'me', to: 'profiles#me', as: :user_profile

  root to: 'home#index'
end
