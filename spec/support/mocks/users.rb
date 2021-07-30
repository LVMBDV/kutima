# frozen_string_literal: true

module Mocks
  ##
  # Mocks for application users.
  module Users
    def mock_user
      create(:user)
    end

    def mock_onboarded_user
      user = mock_user
      create(:profile, user: user)
      user
    end
  end
end
