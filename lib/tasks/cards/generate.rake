require_relative 'card_creation'

namespace :cards do
  desc 'Generates visual identity of cards with QR codes (unique)'
  task generate: :environment do
    raise '---- Run me in DEV env ----' unless Rails.env.development?
    cards_count = Card.count
    started_at = Time.now

    puts "Processing #{cards_count} cards at #{started_at}"

    Parallel.each_with_index(Card.find_each, in_processes: 8, progress: '_______________') do |card, i|
      print "\r-> #{i}/#{cards_count}\r"
      get_card_image(card)
    end

    finished_at = Time.now
    minutes_elapsed = (finished_at - started_at).to_i / 60
    seconds_elapsed = (finished_at - started_at - minutes_elapsed * 60)

    puts "Finished at #{finished_at} in #{minutes_elapsed} minutes and #{seconds_elapsed.round(2)} seconds"
  end
end
