# frozen_string_literal: true

require 'rails_helper'

describe 'home/index.html.erb', type: :view do
  before do
    render
  end

  it 'renders the home page with title' do
    expect(rendered).to match(/#{I18n.t('pages.home.title')}/)
  end

  it 'renders the home page with body text' do
    expect(rendered).to match(/#{I18n.t('pages.home.lede')}/)
  end
end
