# frozen_string_literal: true

##
# Base controller class.
class ApplicationController < ActionController::Base
  include Securable
  before_action :authenticate_user
end
