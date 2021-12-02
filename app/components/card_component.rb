# frozen_string_literal: true

##
# Componentizes cards.
class CardComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  CARD_CLASS_LIST = 'p-0 max-w-lg mx-auto my-4 bg-white dark:bg-gray-700 rounded-xl shadow-md items-center'
  CARD_HEADER_CLASS_LIST = 'flex justify-between flex-row flex-wrap text-sm px-2 pt-4'
  CARD_BODY_CLASS_LIST = 'm-0 px-3 py-6'

  renders_one :header, lambda { |options: {}, &block|
    tag.div class: merge_classes([CARD_HEADER_CLASS_LIST, options[:classes]]) do
      block.call
    end
  }

  renders_one :body, lambda { |options: {}, &block|
    tag.div class: merge_classes([CARD_BODY_CLASS_LIST, options[:classes]]) do
      block.call
    end
  }

  def initialize(options: {})
    super
    @classes = merge_classes([CARD_CLASS_LIST, options[:classes]])
  end
end
