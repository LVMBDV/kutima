# frozen_string_literal: true

require 'rails_helper'

describe ButtonToComponent, type: :component do
  context 'with only required values' do
    subject(:render_component) do
      render_inline(described_class.new(link: 'foo/bar')) { 'Sample Text' }
    end

    it 'renders a button' do
      expect(render_component).to have_button
    end

    it 'renders the provided form action' do
      expect(render_component).to have_xpath(".//form[@action='foo/bar']")
    end

    it 'renders the default form method' do
      expect(render_component).to have_xpath(".//form[@method='post']")
    end

    it 'renders the correct button text' do
      expect(render_component).to have_content('Sample Text')
    end

    it 'renders the default color class' do
      expect(render_component).to have_css('button.bg-blue-500.text-white.border-blue-500')
    end
  end

  context 'with method specified' do
    subject(:render_component) do
      render_inline(described_class.new(link: 'foo/bar', method: :get)) { 'Sample Text' }
    end

    it 'renders the provided form method' do
      expect(render_component).to have_xpath(".//form[@method='get']")
    end
  end

  context 'with variant specified' do
    subject(:render_component) do
      render_inline(described_class.new(link: 'foo/bar', options: { variant: :outline_blue })) { 'Sample Text' }
    end

    it 'renders the correct outline classes' do
      expect(render_component).to have_css('button.bg-transparent.text-blue-500.border-blue-500')
    end
  end

  context 'with data attributes' do
    subject(:render_component) do
      render_inline(described_class.new(link: 'foo/bar', options: { data: { foo: 'bar' } })) { 'Sample Text' }
    end

    it 'renders the provided data attributes' do
      expect(render_component).to have_xpath(".//button[@data-foo='bar']")
    end
  end

  context 'with classes' do
    subject(:render_component) do
      render_inline(described_class.new(link: 'foo/bar', options: { classes: 'foo' })) { 'Sample Text' }
    end

    it 'renders the provided classes' do
      expect(render_component).to have_css('form button.foo')
    end
  end
end
