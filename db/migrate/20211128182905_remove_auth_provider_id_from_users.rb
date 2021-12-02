# frozen_string_literal: true

class RemoveAuthProviderIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :auth_provider_id, :string
  end
end
