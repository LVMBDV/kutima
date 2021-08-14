# frozen_string_literal: true

require 'rails_helper'

describe 'IdentityStatements', type: :request do
  let(:user) { mock_onboarded_user }
  let(:valid_attributes) { attributes_for(:identity_statement, user: user) }
  let(:invalid_attributes) { attributes_for(:identity_statement, identity: nil, user: user) }

  before do
    Utils::Auth.login(user, roles: [])
  end

  describe 'GET /identity-statements/new' do
    subject(:visit_endpoint) { get new_identity_statement_path }

    it 'renders a successful response' do
      visit_endpoint
      expect(response).to be_successful
    end
  end

  describe 'GET /identity-statements/new-reset' do
    subject(:visit_endpoint) { get new_reset_identity_statements_path }

    it 'renders a successful response' do
      visit_endpoint
      expect(response).to be_successful
    end
  end

  describe 'GET /identity-statements/:id' do
    subject(:visit_endpoint) { get identity_statement_path(identity_statement) }

    let(:identity_statement) { create(:identity_statement, user: user) }

    it 'renders a successful response' do
      visit_endpoint
      expect(response).to be_successful
    end
  end

  describe 'GET /identity-statements/:id/edit' do
    subject(:visit_endpoint) { get edit_identity_statement_path(identity_statement) }

    let(:identity_statement) { create(:identity_statement, user: user) }

    it 'renders a successful response' do
      visit_endpoint
      expect(response).to be_successful
    end
  end

  describe 'POST /identity-statements' do
    context 'when request has invalid parameters' do
      subject(:visit_endpoint) do
        post identity_statements_path, params: { identity_statement: invalid_attributes }
      end

      it 'does not create a new identity statement' do
        expect { visit_endpoint }.not_to change(IdentityStatement, :count)
      end
    end

    context 'when request has valid parameters' do
      subject(:visit_endpoint) do
        post identity_statements_path, params: { identity_statement: valid_attributes }
      end

      it 'creates a new identity statement' do
        expect { visit_endpoint }.to change(IdentityStatement, :count).by(1)
      end
    end
  end

  describe 'PATCH/PUT /identity-statements/:id' do
    let(:identity_statement) { create(:identity_statement, user: user) }

    context 'when the request has invalid parameters' do
      subject(:visit_endpoint) do
        patch identity_statement_path(identity_statement), params: { identity_statement: invalid_attributes }
      end

      it 'does not update identity statement' do
        expect do
          visit_endpoint
          identity_statement.reload
        end.not_to change(identity_statement, :identity)
      end
    end

    context 'when the request has valid parameters' do
      subject(:visit_endpoint) do
        patch identity_statement_path(identity_statement), params: { identity_statement: valid_attributes }
      end

      it 'updates identity statement' do
        expect do
          visit_endpoint
          identity_statement.reload
        end.to change(identity_statement, :life_area)
      end
    end
  end

  describe 'DELETE /identity-statements/:id' do
    subject(:visit_endpoint) { delete identity_statement_path(identity_statement) }

    let!(:identity_statement) { create(:identity_statement, user: user) }

    it 'deletes an identity statement' do
      expect { visit_endpoint }.to change(IdentityStatement, :count).by(-1)
    end
  end
end
