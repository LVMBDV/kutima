# frozen_string_literal: true

module Mixins
  ##
  # Provides utility functions relevant to all components.
  module UtilityMixins
    def merge_classes(class_str_arr)
      class_str_arr.compact.join(' ')
    end
  end
end
