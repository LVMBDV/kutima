# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get 'health-check', to: 'health_check#check', as: :health_check
  root to: 'home#index'
end
