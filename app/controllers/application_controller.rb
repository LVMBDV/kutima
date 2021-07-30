# frozen_string_literal: true

##
# Base controller class.
class ApplicationController < ActionController::Base
  include Securable
  before_action :authenticate_user
  before_action :onboard_user, unless: :user_can_onboard?

  private

  def onboard_user
    redirect_to new_profile_path
  end

  def user_can_onboard?
    return false unless signed_in?

    current_user.profile.try(:first_name) && current_user.profile.try(:last_name)
  end
end
