# frozen_string_literal: true

##
# Provides methods for ensuring users are onboarded.
module Onboardable
  extend ActiveSupport::Concern

  included do
    before_action :onboard_user, unless: :user_onboarded?
  end

  def onboard_user
    redirect_to new_profile_path if user_signed_in?
  end

  def user_onboarded?
    current_user&.profile&.name?
  end
end
