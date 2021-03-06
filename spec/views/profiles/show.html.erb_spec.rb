# frozen_string_literal: true

require 'rails_helper'

describe 'profiles/show', type: :view do
  let(:user) { mock_onboarded_user }
  let(:other_user) { mock_user }
  let(:profile) { create(:profile, user: other_user) }

  before do
    sign_in user
    @profile = profile
    render
  end

  it 'renders the profile\'s first name' do
    expect(rendered).to match(/#{profile.first_name}/)
  end

  it 'renders the profile\'s last name' do
    expect(rendered).to match(/#{profile.last_name}/)
  end

  it 'renders the profile\'s user name' do
    expect(rendered).to match(/#{profile.user.username}/)
  end
end
