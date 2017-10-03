class Adapter

  def self.get_beer_hash
    beer = RestClient.get("https://api.punkapi.com/v2/beers") #? per_page = 80
    beer_hash = JSON.parse(beer)
  end

  def self.create_beers_and_ingredients
    beer_hash = Adapter.get_beer_hash
    beer_hash.each {|beer| Beer.find_or_create_by(name: beer['name'])}

    beer_hash.each do |beer|
      beer['ingredients'].each do |key, value|
        if value.class == Array
          value.each do |ingredient|
            Ingredient.find_or_create_by(name: "#{ingredient['name']} #{key}")
          end
        elsif value.class != Array
          Ingredient.find_or_create_by(name: value)
        end
      end
    end
  end

  def self.match_beers_ingredients
    get_beer_hash.each do |beer|
      beer_object = Beer.find_or_create_by(name: beer['name'])

      beer['ingredients'].each do |key, value|
        if value.class == Array
          value.each do |array|
          # binding.pry
          ingredient_object = Ingredient.find_or_create_by(name: "#{array['name']} #{key}")
          beer_object.ingredients << ingredient_object
        end
        else
          beer_object.ingredients << Ingredient.find_or_create_by(name: value)
        end
      end
    end
  end
end

#Adapter.match_beers_ingredients
