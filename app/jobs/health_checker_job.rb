# frozen_string_literal: true

class HealthCheckerJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    logger.info 'Health check successful'
  end
end
