# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  mount Sidekiq::Web => '/sidekiq'
  get 'health-check', to: 'health_check#check', as: :health_check

  get 'dashboard', to: 'dashboard#show', as: :dashboard

  resources :profiles, except: :destroy

  resources :identity_statements, path: 'identity-statements' do
    get 'new-reset', to: 'identity_statements#new_reset', as: :new_reset, on: :collection
  end

  get 'me', to: 'profiles#me', as: :user_profile

  scope :settings do
    get '/', to: 'settings#show', as: :settings
    get '/details', to: 'settings#details', as: :account_details
    get '/details/edit', to: 'settings#edit_details', as: :edit_account_details
    put '/details', to: 'settings#update_details', as: :update_account_details
    get '/password', to: 'settings#password', as: :change_password
    put '/password', to: 'settings#update_password', as: :update_password
    get '/password/edit', to: 'settings#edit_password', as: :change_password_form
    get '/account/delete', to: 'settings#delete_account', as: :delete_account
    delete '/account/delete', to: 'settings#destroy_account', as: :destroy_account
  end

  root to: 'home#index'
end
