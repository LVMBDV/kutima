# frozen_string_literal: true

require 'rails_helper'

describe CardComponent, type: :component do
  subject(:render_component) do
    render_inline(described_class.new) do |component|
      component.header { 'This is a test header' }
      component.body { 'This is a test body' }
    end
  end

  it 'renders an element with the correct CSS class for the card element' do
    expect(render_component).to have_css(
      'div[class="p-0 max-w-lg mx-auto my-4 bg-white dark:bg-gray-700 rounded-xl shadow-md items-center"]'
    )
  end

  it 'renders an element with the correct CSS class for the card header' do
    expect(render_component).to have_css(
      'div[class="flex justify-between flex-row flex-wrap text-sm px-2 pt-4"]'
    )
  end

  it 'renders an element with the correct CSS class for the card body' do
    expect(render_component).to have_css('div[class="m-0 px-3 py-6"]')
  end

  it 'renders a header' do
    expect(render_component).to have_text('This is a test header')
  end

  it 'renders a body' do
    expect(render_component).to have_text('This is a test body')
  end
end
