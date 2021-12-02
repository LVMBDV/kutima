# frozen_string_literal: true

##
# Provides component for grouped form labels and fields as well as error validations.
class FormGroupComponent < ViewComponent::Base
  include Mixins::UtilityMixins

  # rubocop:disable Layout/LineLength
  INPUT_CLASS_LIST = 'block w-full appearance-none leading-loose transition-colors placeholder-gray-400 hover:border-gray-400 focus:border-blue-500 rounded my-2'
  # rubocop:enable Layout/LineLength

  renders_one :label, lambda { |text, options: {}|
    @form.label(
      @field,
      text,
      for: @field,
      class: merge_classes(['text-gray-900 dark:text-white font-semibold', options[:classes]])
    )
  }

  renders_one :select, lambda { |choices, options: {}, html_options: {}|
    @form.select(
      @field,
      choices,
      options,
      html_options.merge(class: merge_classes([INPUT_CLASS_LIST, html_options[:classes]]))
    )
  }

  renders_one :text, lambda { |html_options: {}|
    @form.text_field(
      @field,
      html_options.merge(class: merge_classes([INPUT_CLASS_LIST, html_options[:classes]]))
    )
  }

  renders_one :date, lambda { |html_options: {}|
    tag.div class: 'flex w-full justify-items-center justify-evenly' do
      @form.date_select(
        @field,
        prompt: { day: 'Select day', month: 'Select month', year: 'Select year' },
        end_year: (html_options[:end_year] || nil),
        start_year: (html_options[:start_year] || 3.years.ago.year),
        start_month: (html_options[:start_month] || DateTime.current.beginning_of_year.month),
        start_day: (html_options[:start_day] || DateTime.current.beginning_of_year.day),
        with_css_classes: {
          month: merge_classes([INPUT_CLASS_LIST.gsub(/block w-full/, ''), html_options[:classes]]),
          day: merge_classes([INPUT_CLASS_LIST.gsub(/block w-full/, ''), html_options[:classes]]),
          year: merge_classes([INPUT_CLASS_LIST.gsub(/block w-full/, ''), html_options[:classes]])
        }
      )
    end
  }

  def initialize(form:, field:, errors:)
    super
    @form = form
    @field = field
    @errors = errors
  end
end
