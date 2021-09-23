# frozen_string_literal: true

require 'rails_helper'

describe IdentityStatementComponent, type: :component do
  subject(:render_component) do
    render_inline(described_class.new(identity_statement: identity_statement))
  end

  let(:user) { mock_onboarded_user }
  let(:identity_statement) { create(:identity_statement, user: user) }

  describe 'renders a card header' do
    it 'with correct CSS class' do
      expect(render_component).to have_css('div[class="Card__header"]')
    end
  end

  describe 'renders a card body' do
    it 'with correct CSS class' do
      expect(render_component).to have_css('div[class="Card__body"]')
    end

    it 'that contains the templated identity statement' do
      expect(render_component).to have_css(
        'div.Card > div.Card__body > p.IdentityStatement__statement',
        text: "I am a(n) #{identity_statement.identity} who #{identity_statement.objective}."
      )
    end
  end
end
