# frozen_string_literal: true

require 'rails_helper'

describe 'identity_statements/show', type: :view do
  let(:user) { mock_onboarded_user }
  let(:identity_statement) { create(:identity_statement, user: user) }

  before do
    @user = user
    @identity_statement = identity_statement
    render
  end

  it 'that contains the templated identity statement' do
    expect(rendered).to have_text(
      "I am a(n) #{identity_statement.identity} who #{identity_statement.objective}."
    )
  end
end
