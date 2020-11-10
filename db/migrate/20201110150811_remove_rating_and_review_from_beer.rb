class RemoveRatingAndReviewFromBeer < ActiveRecord::Migration[6.0]
  def change
    remove_column :beers, :rating
    remove_column :beers, :review
  end
end
