# frozen_string_literal: true

require 'rails_helper'

describe 'profiles/new', type: :view do
  let(:user) { mock_user }

  before do
    @profile = Profile.new
    render
  end

  it 'renders new profile form' do
    assert_select 'form[action=?][method=?]', profiles_path, 'post' do
      assert_select 'input[name=?]', 'profile[first_name]'
      assert_select 'input[name=?]', 'profile[last_name]'
    end
  end
end
