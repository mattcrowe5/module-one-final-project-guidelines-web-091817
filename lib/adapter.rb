def get_beer_hash
  beer = RestClient.get("https://api.punkapi.com/v2/beers")
  beer_hash = JSON.parse(beer)
end

get_beer_hash
