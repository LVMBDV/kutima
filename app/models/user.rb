# frozen_string_literal: true

##
# Models an application user.
class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :identity_statements, dependent: :destroy

  # Ensures user has information synced with auth provider.
  def self.from_auth_provider(auth_provider_id:, username:, email:, roles:) # rubocop:disable Lint/UnusedMethodArgument
    find_or_initialize_by(auth_provider_id: auth_provider_id) do |user|
      unless user.email == email && user.username == username
        user.username = username
        user.email = email
        user.save
      end
    end
  end
end
