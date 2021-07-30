# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name { 'MyString' }
    last_name { 'MyString' }
    association :user
  end
end
