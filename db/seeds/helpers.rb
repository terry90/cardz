def lolcat(width = 1200, height = 800)
  begin
    Net::HTTP.get_response(URI.parse('http://thecatapi.com/api/images/get?format=src&size=full&api_key=OTc5ODU'))['location']
  rescue
    "http://lorempixel.com/#{width}/#{height}/animals/"
  end
end
