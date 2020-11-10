class Beer < ApplicationRecord
  has_many :favorites, inverse_of: :beer, dependent: :destroy
  has_many :users, through: :favorites
end
