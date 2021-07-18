# frozen_string_literal: true

module EventLogger
  ##
  # Indicates invalid log level provided.
  class InvalidLoggerLevel < StandardError
    def initialize(msg = 'Invalid logger level provided. Valid levels: debug, info, warn, error, fatal.')
      super
    end
  end

  ##
  # Indicates event provided not registered.
  class UnregisteredEvent < StandardError
    def initialize(msg = 'Event provided not registered.')
      super
    end
  end

  ##
  # Outputs event and related data logs.
  class Log
    WHITELISTED_LOGGER_LEVELS = %i[debug info warn error fatal].freeze
    REGISTERED_EVENTS = %w[testing.event monitoring.event-logger.failure monitoring.health-check.success
                           monitoring.job-integration.successful].freeze

    def self.call(*tags, **params)
      level, event = *tags
      validate_event(level, event)
      logger = ActiveSupport::TaggedLogging.new(Logger.new($stdout))
      logger.tagged("#{level.to_s.upcase} | #{DateTime.current} | #{event}") { logger.send(level, **params.as_json) }
    end

    private

    def validate_event(level, event)
      raise EventLogger::InvalidLoggerLevel unless WHITELISTED_LOGGER_LEVELS.include?(level)
      raise EventLogger::UnregisteredEvent unless REGISTERED_EVENTS.include?(event)
    end
  end
end
