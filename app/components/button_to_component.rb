# frozen_string_literal: true

##
# Component that wraps buttons generated using button_to.
class ButtonToComponent < ViewComponent::Base
  include Mixins::UtilityMixins
  include Mixins::ButtonMixins

  attr_reader :link, :method, :data, :classes

  def initialize(link:, method: :post, options: {})
    super
    @link = link
    @method = method
    @data = options[:data]
    @classes = merge_classes([
                               CLASS_LIST,
                               color_classes(color: options[:color] || :blue, outline: options[:outline]),
                               options[:classes]
                             ])
  end

  def call
    button_to(link, method: method, class: classes, data: data) do
      content
    end
  end
end
