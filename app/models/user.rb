class User < ActiveRecord::Base
  has_many :user_beers
  has_many :beers, through: :user_beers

  def add_beer_to_favorites(beer)
    binding.pry
    fav_beer = Beer.all.find_or_create_by(name: beer)
    self.beers << fav_beer
  end

  def list_favs  #REVISIT
    counter = 0
    self.beers.each do |beer|
      counter += 1
      puts "#{counter}. #{beer}"
    end
  end


end
