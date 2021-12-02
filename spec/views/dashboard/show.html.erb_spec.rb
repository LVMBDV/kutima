# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/show', type: :view do
  let(:user) { mock_onboarded_user }
  let(:identity_statements) { create_list(:identity_statement, 3, user: user) }

  before do
    @user = user
    @identity_statements = identity_statements
    render
  end

  it 'renders the home page with title' do
    expect(rendered).to match(/#{I18n.t('pages.dashboard.title', name: user.profile.first_name)}/)
  end
end
