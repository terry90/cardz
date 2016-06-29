require_relative 'production'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/production.rb.

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "cardz_#{Rails.env}"
  config.action_mailer.perform_caching = false

  Mail.register_interceptor RecipientInterceptor.new(
    ENV.fetch('EMAIL_RECIPIENTS') { 'dev@dartagnans.fr' },
    subject_prefix: '[STAGING]'
  )
end
