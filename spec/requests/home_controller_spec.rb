# frozen_string_literal: true

require 'rails_helper'

describe HomeController, type: :request do
  describe 'GET /index when unauthenticated' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index when authenticated' do
    it 'redirects to dashboard' do
      sign_in mock_onboarded_user
      get root_path
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
