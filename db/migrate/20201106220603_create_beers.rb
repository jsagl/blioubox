class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :kind
      t.string :brewery_name
      t.string :brewery_url
      t.string :brewery_country
      t.string :brewery_city
      t.text :description
      t.float :abv
      t.integer :ibu
      t.string :logo_url
      t.text :review
      t.float :rating
      t.string :beer_url

      t.timestamps
    end
  end
end
