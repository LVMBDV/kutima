# frozen_string_literal: true

##
# Provides a Postgresql ENUM type
module LifeArea
  AREAS = {
    career: 'career',
    financial: 'financial',
    spiritual: 'spiritual',
    physical: 'physical',
    intellectual: 'intellectual',
    family: 'family',
    social: 'social'
  }.freeze
end
