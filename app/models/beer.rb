class Beer < ActiveRecord::Base
  has_many :beer_ingredients
  has_many :ingredients, through: :beer_ingredients
  has_many :userbeers
  has_many :users, through: :userbeers

  def find_desc
    parsed_hash = Adapter.get_beer_hash
    parsed_hash.map do |beer|
      if beer['name'] == self.name
        beer['description']
      end
    end.compact.first
  end

end
