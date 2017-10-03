class CreateUserBeers < ActiveRecord::Migration
  def change
    create_table :user_beers do |t|
      t.integer :beer_id
      t.integer :user_id
    end
  end
end
