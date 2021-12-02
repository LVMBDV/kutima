# frozen_string_literal: true

##
# Base mailer class.
class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{ENV['APP_DOMAIN']}"
  layout 'mailer'
end
