# frozen_string_literal: true

require 'rails_helper'

describe DashboardController, type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      Utils::Auth.login(mock_onboarded_user, roles: [])
      get dashboard_path
      expect(response).to have_http_status(:success)
    end
  end
end
