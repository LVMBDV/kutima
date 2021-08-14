# frozen_string_literal: true

require 'rails_helper'

describe IdentityStatementsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/identity-statements/new').to route_to('identity_statements#new')
    end

    it 'routes to #new_reset' do
      expect(get: '/identity-statements/new-reset').to route_to('identity_statements#new_reset')
    end

    it 'routes to #show' do
      expect(get: '/identity-statements/1').to route_to('identity_statements#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/identity-statements/1/edit').to route_to('identity_statements#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/identity-statements').to route_to('identity_statements#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/identity-statements/1').to route_to('identity_statements#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/identity-statements/1').to route_to('identity_statements#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/identity-statements/1').to route_to('identity_statements#destroy', id: '1')
    end
  end
end
