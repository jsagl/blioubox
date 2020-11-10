class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :beer, null: false, foreign_key: true
      t.float :rating

      t.timestamps
    end
  end
end
