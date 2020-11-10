class Favorite < ApplicationRecord
  belongs_to :user, inverse_of: :favorites
  belongs_to :beer, inverse_of: :favorites
end
