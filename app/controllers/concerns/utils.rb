# frozen_string_literal: true

##
# Provides utility methods for controllers.
# :reek:UtilityFunction
module Utils
  extend ActiveSupport::Concern

  def to_query(hash)
    hash.map { |key, value| "#{key}=#{CGI.escape(value)}" if value.present? }
        .reject(&:blank?)
        .join('&')
  end
end
