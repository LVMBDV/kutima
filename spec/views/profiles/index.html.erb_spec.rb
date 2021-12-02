# frozen_string_literal: true

require 'rails_helper'

describe 'profiles/index', type: :view do
  let(:user) { mock_onboarded_user }
  let(:profile) { create(:profile, user: user) }
  let(:profiles) { create_list(:profile, 3) }

  before do
    @profiles = profiles.push profile
    sign_in user
    render
  end

  # rubocop:disable RSpec/MultipleExpectations
  it 'renders a list of profiles' do
    profiles.each do |profile|
      expect(rendered).to match(/#{profile.first_name}/)
      expect(rendered).to match(/#{profile.last_name}/)
      expect(rendered).to match(/#{profile.user.username}/)
    end
  end
  # rubocop:enable RSpec/MultipleExpectations
end
