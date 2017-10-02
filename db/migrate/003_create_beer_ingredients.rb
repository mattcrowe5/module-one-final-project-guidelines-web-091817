class CreateBeerIngredients < ActiveRecord::Migration
  def change
    create_table :beer_ingredients do |t|
      t.integer :beer_id
      t.integer :ingredient_id
    end
  end
end
