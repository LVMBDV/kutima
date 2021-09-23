# frozen_string_literal: true

require 'rails_helper'

describe CardHeaderComponent, type: :component do
  subject(:render_component) do
    render_inline(described_class.new) { 'This is a test' }
  end

  it 'renders an element with the correct CSS class' do
    expect(render_component).to have_css('div[class="Card__header"]')
  end

  it 'renders content passed to block' do
    expect(render_component).to have_text('This is a test')
  end
end
