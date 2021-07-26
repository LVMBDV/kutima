# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get 'health-check', to: 'health_check#check', as: :health_check

  get 'dashboard', to: 'dashboard#show', as: :dashboard

  scope :auth do
    get 'auth0/callback', to: 'auth0#callback', as: :auth_callback
    get 'failure', to: 'auth0#failure', as: :auth_failure
    get 'logout', to: 'auth0#logout', as: :auth_logout
  end

  root to: 'home#index'
end
