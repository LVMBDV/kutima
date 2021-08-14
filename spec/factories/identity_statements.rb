# frozen_string_literal: true

FactoryBot.define do
  factory :identity_statement do
    life_area { LifeArea::AREAS.values.sample }
    identity { 'MyString' }
    objective { 'MyString' }
    association :user
  end
end
