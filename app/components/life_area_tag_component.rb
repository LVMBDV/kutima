# frozen_string_literal: true

##
# Component for life area tags.
class LifeAreaTagComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  BASE_CLASSES = 'px-1 border-2 border-solid rounded-md'
  private_constant :BASE_CLASSES

  AREA_CLASSES = {
    career: 'text-blue-600 border-blue-600',
    financial: 'text-green-500 border-green-500',
    spiritual: 'text-indigo-600 border-indigo-600',
    physical: 'text-red-600 border-red-600',
    intellectual: 'text-yellow-500 border-yellow-500',
    family: 'text-pink-400 border-pink-400',
    social: 'text-yellow-700 border-yellow-700'
  }.freeze
  private_constant :AREA_CLASSES

  def initialize(area:)
    super
    @area = area.to_sym
  end

  def call
    tag.span area, class: merge_classes([BASE_CLASSES, AREA_CLASSES[area]])
  end

  private

  attr_reader :area
end
