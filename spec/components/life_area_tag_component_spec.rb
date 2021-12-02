# frozen_string_literal: true

require 'rails_helper'

describe LifeAreaTagComponent, type: :component do
  it 'renders the base classes' do
    expect(
      render_inline(described_class.new(area: 'career'))
    ).to have_css('span.px-1.border-2.border-solid.rounded-md')
  end

  it 'renders the correct classes for the career area' do
    expect(
      render_inline(described_class.new(area: 'career'))
    ).to have_css('span.text-blue-600.border-blue-600')
  end

  it 'renders the correct classes for the financial area' do
    expect(
      render_inline(described_class.new(area: 'financial'))
    ).to have_css('span.text-green-500.border-green-500')
  end

  it 'renders the correct classes for the spiritual area' do
    expect(
      render_inline(described_class.new(area: 'spiritual'))
    ).to have_css('span.text-indigo-600.border-indigo-600')
  end

  it 'renders the correct classes for the physical area' do
    expect(
      render_inline(described_class.new(area: 'physical'))
    ).to have_css('span.text-red-600.border-red-600')
  end

  it 'renders the correct classes for the intellectual area' do
    expect(
      render_inline(described_class.new(area: 'intellectual'))
    ).to have_css('span.text-yellow-500.border-yellow-500')
  end

  it 'renders the correct classes for the family area' do
    expect(
      render_inline(described_class.new(area: 'family'))
    ).to have_css('span.text-pink-400.border-pink-400')
  end

  it 'renders the correct classes for the social area' do
    expect(
      render_inline(described_class.new(area: 'social'))
    ).to have_css('span.text-yellow-700.border-yellow-700')
  end
end
