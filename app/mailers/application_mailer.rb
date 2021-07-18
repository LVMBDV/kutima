# frozen_string_literal: true

##
# Base mailer class.
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@kutima.com'
  layout 'mailer'
end
