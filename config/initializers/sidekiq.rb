Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') { 'redis://localhost:6379' }, namespace: 'sidekiq' }

  database_url = ENV['DATABASE_URL']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
    # Note that as of Rails 4.1 the `establish_connection` method requires
    # the database_url be passed in as an argument. Like this:
    # ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  end
end