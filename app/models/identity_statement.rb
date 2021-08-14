# frozen_string_literal: true

##
# Models an identity statement.
class IdentityStatement < ApplicationRecord
  belongs_to :user

  enum life_area: LifeArea::AREAS, _suffix: true

  validates :life_area, presence: true, inclusion: { in: LifeArea::AREAS.values }
  validates :identity, presence: true, length: { minimum: 3, maximum: 45 }
  validates :objective, presence: true, length: { minimum: 3, maximum: 255 }
end
