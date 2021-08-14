# frozen_string_literal: true

require 'rails_helper'

describe 'dashboard/show.html.erb', type: :view do
  let(:user) { mock_user }

  before do
    @user = user
    create(:profile, user: user)
    render
  end

  it 'renders the home page with title' do
    expect(rendered).to match(/#{I18n.t('pages.dashboard.title', name: user.profile.first_name)}/)
  end
end
