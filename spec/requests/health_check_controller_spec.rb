# frozen_string_literal: true

require 'rails_helper'

describe 'HealthChecks', type: :request do
  describe 'GET /index' do
    it_behaves_like 'an endpoint that logs events', :get, :health_check_path

    it 'responds with HTTP status OK' do
      get health_check_path
      expect(response).to have_http_status :ok
    end
  end
end
