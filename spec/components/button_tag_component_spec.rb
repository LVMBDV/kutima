# frozen_string_literal: true

require 'rails_helper'

describe ButtonTagComponent, type: :component do
  context 'with no parameters' do
    subject(:render_component) do
      render_inline(described_class.new) { 'Sample Text' }
    end

    it 'renders a button with submit type' do
      expect(render_component).to have_xpath(".//button[@type='submit']")
    end

    it 'renders the default color class' do
      expect(render_component).to have_css('button.bg-blue-500.text-white.border-blue-500')
    end
  end

  context 'with color specified' do
    subject(:render_component) do
      render_inline(described_class.new(options: { color: 'red' })) { 'Sample Text' }
    end

    it 'renders the correct classes for the provided color' do
      expect(render_component).to have_css('button.bg-red-500.text-white.border-red-500')
    end
  end

  context 'with outline specified' do
    subject(:render_component) do
      render_inline(described_class.new(options: { outline: true })) { 'Sample Text' }
    end

    it 'renders the correct outline classes' do
      expect(render_component).to have_css('button.bg-transparent.text-blue-500.border-blue-500')
    end
  end

  context 'with both color and outline specified' do
    subject(:render_component) do
      render_inline(described_class.new(options: { color: 'red', outline: true })) { 'Sample Text' }
    end

    it 'renders the correct classes for the provided color with outline' do
      expect(render_component).to have_css('button.bg-transparent.text-red-500.border-red-500')
    end
  end

  context 'with data attributes' do
    subject(:render_component) do
      render_inline(described_class.new(options: { data: { foo: 'bar' } })) { 'Sample Text' }
    end

    it 'renders the provided data attributes' do
      expect(render_component).to have_xpath(".//button[@data-foo='bar']")
    end
  end

  context 'with classes' do
    subject(:render_component) do
      render_inline(described_class.new(options: { classes: 'foo' })) { 'Sample Text' }
    end

    it 'renders the provided classes' do
      expect(render_component).to have_css('button.foo')
    end
  end
end
