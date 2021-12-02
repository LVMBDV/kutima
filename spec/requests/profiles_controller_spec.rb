# frozen_string_literal: true

require 'rails_helper'

describe ProfilesController, type: :request do
  let(:user) { mock_user }
  let(:valid_attributes) { attributes_for(:profile, user: user) }
  let(:invalid_attributes) { attributes_for(:profile, first_name: nil, user: user) }

  before do
    sign_in user
  end

  describe 'GET /profiles' do
    before { create(:profile, user: user) }

    it 'renders a successful response' do
      get profiles_path
      expect(response).to be_successful
    end
  end

  describe 'GET /profiles/:id' do
    it 'renders a successful response' do
      user_profile = create(:profile, user: user)
      get profile_path(user_profile)
      expect(response).to be_successful
    end
  end

  describe 'GET /me' do
    it 'renders a successful response' do
      create(:profile, user: user)
      get user_profile_path
      expect(response).to be_successful
    end
  end

  describe 'GET /profiles/new' do
    context 'when user has no profile data' do
      it 'renders a successful response' do
        get new_profile_path
        expect(response).to be_successful
      end
    end

    context 'when user has profile data' do
      it 'redirects to the users profile' do
        profile = create(:profile, user: user)
        get new_profile_path
        expect(response).to redirect_to(profile_path(profile))
      end
    end
  end

  describe 'GET /profiles/:id/edit' do
    it 'render a successful response' do
      profile = create(:profile, user: user)
      get edit_profile_path(profile)
      expect(response).to be_successful
    end
  end

  describe 'POST /profiles' do
    context 'when the request has valid parameters and the user has profile data' do
      subject(:visit_endpoint) do
        post profiles_path, params: { profile: valid_attributes }
      end

      before { create(:profile, user: user) }

      it 'does not create a new Profile' do
        expect { visit_endpoint }.to change(Profile, :count).by(0)
      end
    end

    context 'when the request has valid parameters and the user has no profile data' do
      subject(:visit_endpoint) do
        post profiles_path, params: { profile: valid_attributes }
      end

      it 'creates a new Profile' do
        expect { visit_endpoint }.to change(Profile, :count).by(1)
      end

      it 'redirects to the dashboard' do
        visit_endpoint
        expect(response).to redirect_to dashboard_path
      end
    end

    context 'when the request has invalid parameters and user has profile data' do
      subject(:visit_endpoint) do
        post profiles_path, params: { profile: invalid_attributes }
      end

      before { create(:profile, user: user) }

      it 'does not create a new Profile' do
        expect { visit_endpoint }.to change(Profile, :count).by(0)
      end
    end

    context 'when the request has invalid parameters and user has no profile data' do
      subject(:visit_endpoint) do
        post profiles_path, params: { profile: invalid_attributes }
      end

      it 'does not create a new Profile' do
        expect { visit_endpoint }.to change(Profile, :count).by(0)
      end

      it 'renders HTTP status unprocessable entity' do
        visit_endpoint
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /profiles/:id' do
    let(:profile) { create(:profile, user: user) }

    context 'with valid parameters' do
      subject(:visit_endpoint) do
        patch profile_path(profile), params: { profile: { first_name: 'Test' } }
      end

      it 'updates the user\'s profile' do
        expect do
          visit_endpoint
          profile.reload
        end.to change(profile, :first_name)
      end

      it 'redirects to the profile' do
        visit_endpoint
        profile.reload
        expect(response).to redirect_to(user_profile_path)
      end
    end

    context 'with invalid parameters' do
      subject(:visit_endpoint) do
        post profiles_path, params: { profile: { first_name: nil } }
      end

      it 'does not update the user\'s profile' do
        expect do
          visit_endpoint
          profile.reload
        end.not_to change(profile, :first_name)
      end

      it 'renders HTTP status unprocessable entity' do
        visit_endpoint
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
