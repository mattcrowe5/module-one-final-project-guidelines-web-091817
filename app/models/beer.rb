class Beer < ActiveRecord::Base
  has_many :beer_ingredients
  has_many :ingredients, through: :beer_ingredients
  has_many :userbeers
  has_many :users, through: :userbeers

  def self.list_beer_names
    Beer.all.map {|beer| beer.name}
  end

end
