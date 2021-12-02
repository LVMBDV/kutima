# frozen_string_literal: true

##
# Base controller class.
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
