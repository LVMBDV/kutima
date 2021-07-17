# frozen_string_literal: true

##
# Provides event logging with relevant controller/request data.
module Loggable
  extend ActiveSupport::Concern

  def log_event(level, event, **data)
    data_to_log = data_from_request.merge(data)
    EventLogger::Log.call(level, event, **data_to_log)
  rescue EventLogger::UnregisteredEvent, EventLogger::InvalidLoggerLevel => e
    log_event :error, 'monitoring.event-logger.failure', message: e.message
  end

  def data_from_request
    {
      controller: controller_name.camelcase,
      action: action_name,
      method: request.method,
      path: request.path,
      remote_ip: request.remote_ip,
      parameters: request.query_parameters.to_json
    }
  end
end
