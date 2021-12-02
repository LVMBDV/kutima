# frozen_string_literal: true

##
# Controller for dashboard.
class DashboardController < ApplicationController
  include Onboardable

  def show
    @user = current_user
  end
end
