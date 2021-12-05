# frozen_string_literal: true

##
# Component for life area tags.
class LifeAreaTagComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  def initialize(area:)
    super
    @area = area.to_sym
  end

  def call
    tag.span area, class: UtilityClasses.for(:life_area_tag, variant: area)
  end

  private

  attr_reader :area
end
