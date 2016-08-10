# Default mailer. All others mailers should inherit from it.
class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('DEFAULT_MAILER_FROM')
  layout 'mailer'
end
