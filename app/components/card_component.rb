# frozen_string_literal: true

##
# Componentizes cards.
class CardComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  renders_one :header, lambda { |options: {}, &block|
    tag.div class: merge_classes([UtilityClasses.for(:card_header), options[:classes]]) do
      block.call
    end
  }

  renders_one :body, lambda { |options: {}, &block|
    tag.div class: merge_classes([UtilityClasses.for(:card_body), options[:classes]]) do
      block.call
    end
  }

  def initialize(options: {})
    super
    @classes = merge_classes([UtilityClasses.for(:card), options[:classes]])
  end
end
