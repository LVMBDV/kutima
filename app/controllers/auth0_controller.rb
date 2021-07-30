# frozen_string_literal: true

##
# Controller for integration with Auth0.
class Auth0Controller < ApplicationController
  include Utils

  skip_before_action :authenticate_user
  skip_before_action :onboard_user

  def callback
    session_from_request
    redirect_to dashboard_path
  end

  def failure
    render json: request.params['message'], status: :bad_request
  end

  def logout
    reset_session
    redirect_to logout_url
  end

  private

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: ENV.fetch('AUTH0_CLIENT_ID')
    }

    URI::HTTPS.build(host: ENV.fetch('AUTH0_DOMAIN'),
                     path: '/v2/logout',
                     query: to_query(request_params)).to_s
  end
end
