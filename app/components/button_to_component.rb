# frozen_string_literal: true

##
# Component that wraps buttons generated using button_to.
class ButtonToComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  attr_reader :link, :method, :data, :classes

  def initialize(link:, method: :post, options: {})
    super
    @link = link
    @method = method
    @data = options[:data]
    @classes = merge_classes([
                               UtilityClasses.for(:btn, variant: (options[:variant] || :solid_blue)),
                               options[:classes]
                             ])
  end

  def call
    button_to(link, method: method, class: classes, data: data) do
      content
    end
  end
end
