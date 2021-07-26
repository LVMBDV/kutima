# frozen_string_literal: true

require 'rails_helper'

describe Auth0Controller, type: :request do
  describe 'GET /callback' do
    it 'returns http success' do
      Utils::Auth.login(mock_user, roles: [])
      get auth_callback_path, params: { code: 'TEST' }
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe 'GET /failure' do
    it 'returns http success' do
      get auth_failure_path
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'GET /logout' do
    it 'returns http success' do
      Utils::Auth.login(mock_user, roles: [])
      get auth_logout_path
      expect(response.location).to match(%r{https://#{ENV.fetch('AUTH0_DOMAIN')}/v2/logout?*})
    end
  end
end
