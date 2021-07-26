# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/show.html.erb', type: :view do
  before do
    render
  end

  it 'renders the home page with title' do
    expect(rendered).to match(/#{I18n.t('pages.dashboard.title')}/)
  end
end
