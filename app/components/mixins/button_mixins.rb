# frozen_string_literal: true

module Mixins
  ##
  # Provides style mixins for buttons.
  module ButtonMixins
    CLASS_LIST = 'appearance-none cursor-pointer inline-block text-lg font-semibold text-center align-middle
                  no-underline select-none transition-colors border-2 border-solid rounded-md px-4 py-3
                  focus:outline-none disabled:cursor-not-allowed disabled:opacity-50'

    def color_classes(color:, outline: false)
      color_s = color.to_s
      if outline
        "bg-transparent text-#{color_s}-500 border-#{color_s}-500 hover:bg-#{color_s}-500 hover:text-white"
      else
        "bg-#{color_s}-500 text-white border-#{color_s}-500 hover:bg-#{color_s}-700"
      end
    end
  end
end
