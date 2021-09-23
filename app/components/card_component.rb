# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  renders_one :header, 'CardHeaderComponent'
  renders_one :body, 'CardBodyComponent'
end
