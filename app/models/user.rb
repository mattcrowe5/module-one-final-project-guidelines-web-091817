class User < ActiveRecord::Base
  has_many :user_beers
  has_many :beers, through: :user_beers

  def add_beer_to_favorites(beer)
    fav_beer = Beer.all.find_or_create_by(name: beer)
    self.beers << fav_beer unless self.get_favorite_beer_names.include?(beer)
  end

  def get_favorite_beer_names
    self.beers.map {|beer| beer.name}
  end

  def list_favs  #REVISIT
    puts "Favorite Beers"
    puts ""
    self.beers.each do |beer|
      puts "~ #{beer.name} ~"
    end
  end

  def remove_beer_from_favorites(beer)
    self.beers.each do |fav|
      self.beers.delete(fav) if fav.name == beer
    end
  end


end
