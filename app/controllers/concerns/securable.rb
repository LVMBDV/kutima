# frozen_string_literal: true

##
# Secures routes that require authentication.
module Securable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :signed_in?
  end

  def current_user
    @current_user ||= user_with_roles
  end

  def authenticate_user
    redirect_to root_path unless signed_in?
  end

  def signed_in?
    session_from_request if request.env['omniauth.auth'].present? && user_session.blank?

    user_session.try(:[], 'sub').present?
  end

  def user_session
    @user_session ||= session[:userinfo]
  end

  def session_from_request
    auth_info = request.env['omniauth.auth']
    session[:userinfo] = auth_info['extra']['raw_info']
  end

  private

  def auth0_client
    @auth0_client ||= Auth0Client.new(
      client_id: ENV.fetch('AUTH0_CLIENT_ID'),
      client_secret: ENV.fetch('AUTH0_CLIENT_SECRET'),
      domain: ENV.fetch('AUTH0_DOMAIN'),
      api_version: 2
    )
  end

  def user_with_roles
    return nil unless signed_in?

    user_from_provider.merge(roles: roles_from_provider)
  end

  def user_from_provider
    auth0_client.user(session[:userinfo]['sub'])
  end

  def roles_from_provider
    auth0_client.get_user_roles(session[:userinfo]['sub'])
  end
end
