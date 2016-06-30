Rails.application.configure do
  config.action_mailer.default_url_options = { host: ENV.fetch('HOST') }

  config.active_job.queue_adapter     = :sidekiq
  config.active_job.queue_name_prefix = "cardz_#{Rails.env}"
end