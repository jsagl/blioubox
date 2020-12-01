class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_beer!, only: [:create]

  def index
    @favorites = current_user.favorites.includes(:beer)
  end

  def create
    Favorite.create!(beer: @beer, user: current_user, rating: params[:rating])

    redirect_to root_path
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to favorites_path
  end

  private

  def set_beer!
    @beer = Beer.find_by(bid: params[:bid].to_i)
  end
end
