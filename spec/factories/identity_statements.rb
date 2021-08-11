# frozen_string_literal: true

FactoryBot.define do
  factory :identity_statement do
    user { nil }
    life_area { '' }
    identity { 'MyString' }
    objective { 'MyString' }
  end
end
