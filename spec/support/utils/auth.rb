# frozen_string_literal: true

module Utils
  ##
  # Authentication-related utilities.
  module Auth
    ##
    # Provides utility method for logging a user in for tests.
    class << self
      attr_reader :user

      def login(user, roles: [])
        @user = user
        authenticate_with_provider
        stub_user_info
        stub_user_roles(roles)
      end

      def logout
        OmniAuth.config.mock_auth[:auth0] = :invalid_credentials
        Rails.application.env_config['omniauth.auth'] = nil
      end

      private

      def authenticate_with_provider
        stub_authentication
        Rails.application.env_config['omniauth.auth'] = configure_mock_auth
      end

      def configure_mock_auth
        OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new(mock_authentication_response)
      end

      # rubocop:disable Metrics/MethodLength
      def mock_authentication_response
        {
          provider: 'auth0',
          uid: 'auth0|USER_ID',
          info: {
            name: 'John Foo',
            email: 'johnfoo@example.org',
            nickname: 'john',
            image: 'https://example.org/john.jpg'
          },
          credentials: {
            token: 'ACCESS_TOKEN',
            expires: true,
            refresh_token: 'REFRESH_TOKEN',
            id_token: 'JWT_ID_TOKEN',
            token_type: 'bearer'
          },
          extra: {
            raw_info: {
              nickname: 'test@test.com',
              name: true,
              picture: 'auth0|TEST',
              updated_at: '',
              iss: '',
              sub: user.auth_provider_id,
              aud: '',
              iat: '',
              exp: '',
              nonce: ''
            }
          }
        }
      end
      # rubocop:enable Metrics/MethodLength

      def stub_authentication
        WebMock::API.stub_request(:post, "https://#{ENV.fetch('AUTH0_DOMAIN')}/oauth/token")
                    .to_return(status: 200, body: { access_token: 'testtoken' }.to_s, headers: {})
      end

      def stub_user_info
        WebMock::API.stub_request(:get, "https://#{ENV.fetch('AUTH0_DOMAIN')}/api/v2/users/#{user.auth_provider_id}?include_fields=true")
                    .with(headers: { 'Content-Type' => 'application/json' })
                    .to_return(status: 200,
                               body: { data: user }.to_json,
                               headers: { content_type: 'application/json' })
      end

      def stub_user_roles(roles)
        WebMock::API.stub_request(:get, "https://#{ENV.fetch('AUTH0_DOMAIN')}/api/v2/users/#{user.auth_provider_id}/roles")
                    .with(headers: { 'Content-Type' => 'application/json' })
                    .to_return(status: 200,
                               body: { data: roles }.to_json,
                               headers: { content_type: 'application/json' })
      end
    end
  end
end
