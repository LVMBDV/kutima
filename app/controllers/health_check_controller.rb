# frozen_string_literal: true

class HealthCheckController < ApplicationController
  def check
    HealthCheckerJob.perform_later 'test'
    head :ok
  end
end
