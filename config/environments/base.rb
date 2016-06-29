Rails.application.configure do
  config.action_mailer.default_url_options = { host: ENV.fetch('HOST') }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV.fetch('SMTP_ADDRESS'), # example: "smtp.sendgrid.net"
    authentication: :plain,
    domain: ENV.fetch('SMTP_DOMAIN'), # example: "heroku.com"
    enable_starttls_auto: true,
    password: ENV.fetch('SMTP_PASSWORD'),
    port: '587',
    user_name: ENV.fetch('SMTP_USERNAME')
  }
end