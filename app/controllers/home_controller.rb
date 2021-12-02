# frozen_string_literal: true

##
# Controller for home page.
class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    redirect_to dashboard_path and return if signed_in?

    render :index
  end
end
