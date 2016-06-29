Rails.application.configure do
  config.action_mailer.default_url_options = { host: ENV.fetch('HOST') }
end