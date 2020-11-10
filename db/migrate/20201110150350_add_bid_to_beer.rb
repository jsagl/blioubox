class AddBidToBeer < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :bid, :integer
    add_index :beers, :bid
  end
end
