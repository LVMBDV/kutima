# frozen_string_literal: true

require 'rails_helper'

describe CardComponent, type: :component do
  subject(:render_component) do
    render_inline(described_class.new) do |component|
      component.header { 'This is a test header' }
      component.body { 'This is a test body' }
    end
  end

  it 'renders an element with the correct CSS class' do
    expect(render_component).to have_css('div[class="Card"]')
  end

  it 'renders a header' do
    expect(render_component).to have_text('This is a test header')
  end

  it 'renders a body' do
    expect(render_component).to have_text('This is a test body')
  end
end
