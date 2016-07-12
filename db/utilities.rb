require 'sidekiq/testing'

def disable_jobs
  puts 'Disabling jobs...'
  Sidekiq::Testing.fake!
end

def clear_jobs
  puts 'Clearing jobs...'
  Sidekiq::Worker.clear_all
end
