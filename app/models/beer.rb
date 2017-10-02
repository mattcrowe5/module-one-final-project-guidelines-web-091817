class Beer < ActiveRecord::Base
  has_many :beer_ingredients
  has_many :ingredients, through: :beer_ingredients
end
