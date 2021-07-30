# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    auth_provider_id { 'MyString' }
    email { 'MyString' }
    username { 'MyString' }
  end
end
