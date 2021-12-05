# frozen_string_literal: true

##
# Component for "hero" layout slices.
class HeroComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  renders_one :headline, lambda { |text, options: {}|
    tag.h1(text, class: merge_classes([UtilityClasses.for(:hero_headline), options[:classes]]))
  }

  renders_one :lede, lambda { |text, options: {}|
    tag.p(text, class: merge_classes([UtilityClasses.for(:hero_lede), options[:classes]]))
  }

  def initialize(options: {})
    super
    @classes = merge_classes([UtilityClasses.for(:hero), options[:classes]])
  end
end
