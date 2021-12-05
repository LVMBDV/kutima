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

    it 'renders the default variant classes' do
      expect(render_component).to have_css('button.bg-blue-500.text-white.border-blue-500')
    end
  end

  context 'with variant specified' do
    subject(:render_component) do
      render_inline(described_class.new(options: { variant: :outline_blue })) { 'Sample Text' }
    end

    it 'renders the correct classes for the provided variant' do
      expect(render_component).to have_css('button.bg-transparent.text-blue-500.border-blue-500')
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
