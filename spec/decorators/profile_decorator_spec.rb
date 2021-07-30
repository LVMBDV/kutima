# frozen_string_literal: true

require 'rails_helper'

describe ProfileDecorator do
  subject(:decorated_profile) { profile.decorate }

  let(:user) { mock_onboarded_user }
  let(:profile) { create(:profile, user: user) }

  describe '#full_name' do
    it 'prints the profiles first and last name' do
      expect(decorated_profile.full_name).to eq("#{profile.first_name} #{profile.last_name}")
    end
  end
end
