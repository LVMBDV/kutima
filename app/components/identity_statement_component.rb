# frozen_string_literal: true

##
# Component class for identity statements.
class IdentityStatementComponent < HotwireComponent
  include ViewComponent::Translatable

  def initialize(identity_statement:)
    @id = identity_statement.id
    @turbo_frame_id = dom_id(identity_statement)
    @identity = identity_statement.identity
    @objective = identity_statement.objective
    @life_area = identity_statement.life_area
    super
  end
end
