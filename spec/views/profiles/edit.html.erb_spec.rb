# frozen_string_literal: true

require 'rails_helper'

describe 'profiles/edit', type: :view do
  let(:user) { mock_user }
  let(:profile) { create(:profile, user: user) }

  before do
    @profile = profile
    render
  end

  it 'renders the edit profile form' do
    assert_select 'form[action=?][method=?]', profile_path(profile), 'post' do
      assert_select 'input[name=?]', 'profile[first_name]'
      assert_select 'input[name=?]', 'profile[last_name]'
    end
  end
end
