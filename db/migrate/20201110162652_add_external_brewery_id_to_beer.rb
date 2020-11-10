class AddExternalBreweryIdToBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :external_brewery_id, :integer
  end
end
