# frozen_string_literal: true

##
# Creates user model.
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :auth_provider_id
      t.string :email
      t.string :username

      t.timestamps
    end
  end
end
