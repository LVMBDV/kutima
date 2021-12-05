# frozen_string_literal: true

##
# Component that wraps buttons generated using button_tag.
class ButtonTagComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  attr_reader :classes, :data, :type

  def initialize(type: :submit, options: {})
    super
    @type = type
    @data = options[:data]
    @classes = merge_classes([
                               UtilityClasses.for(:btn, variant: (options[:variant] || :solid_blue)),
                               options[:classes]
                             ])
  end

  def call
    button_tag(type: type, class: classes, data: data) do
      content
    end
  end
end
