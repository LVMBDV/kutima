# frozen_string_literal: true

##
# Provides a Postgresql ENUM type
class LifeArea
  AREAS = {
    career: 'career',
    financial: 'financial',
    spiritual: 'spiritual',
    physical: 'physical',
    intellectual: 'intellectual',
    family: 'family',
    social: 'social'
  }.freeze

  def initialize(life_area)
    @life_area = life_area
  end
end
