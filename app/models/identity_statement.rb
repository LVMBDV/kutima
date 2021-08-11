# frozen_string_literal: true

##
# Models an identity statement.
class IdentityStatement < ApplicationRecord
  belongs_to :user

  enum life_area: LifeArea::AREAS, _suffix: true

  validates :identity, presence: true, length: { minimum: 3, maximum: 45 }
  validates :objective, presence: true, length: { minimum: 3, maximum: 255 }

  def life_area
    @life_area ||= LifeArea.new(self[:life_area])
  end
end
