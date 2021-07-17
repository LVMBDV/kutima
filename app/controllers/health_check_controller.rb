# frozen_string_literal: true

##
# Performs application health check in response to HTTP request.
# Responds with HTTP status to indicate application health.
class HealthCheckController < ApplicationController
  include Loggable

  def check
    log_event :info, 'monitoring.health-check.success'
    render json: { message: 'Application healthy.' }, status: :ok
  end
end
