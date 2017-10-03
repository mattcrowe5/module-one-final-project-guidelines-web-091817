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

=begin
  WORKING ON THIS 
  def id
    beer_hash
    Beer.all.each.tap do |beer|
      beer_hash[beer.name] = beer.id
    end

    Ingredient.all.each.tap do |ingredient|
      ingredient_hash[ingredient.name] = ingredient.id
    end

=end






end
