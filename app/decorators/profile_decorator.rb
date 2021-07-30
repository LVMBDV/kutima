# frozen_string_literal: true

##
# Adds decorator methods to profile objects.
class ProfileDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
