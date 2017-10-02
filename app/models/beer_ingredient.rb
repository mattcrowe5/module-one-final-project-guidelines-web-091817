class BeerIngredient < ActiveRecord::Base
  belongs_to :beer
  belongs_to :ingredient
end
