# frozen_string_literal: true

##
# Job that validates integration with job service.
class HealthCheckerJob < ApplicationJob
  queue_as :default

  # :reek:UtilityFunction - standard ActiveJob API method
  def perform(*args)
    EventLogger::Log.call(:debug, 'monitoring.job-integration.successful', message: args[0])
  end
end
