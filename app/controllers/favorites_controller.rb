class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_beer!, only: [:create]

  def index
    @beers = current_user.beers
  end

  def create
    Favorite.create!(beer: @beer, user: current_user, rating: params[:rating])

    redirect_to root_path
  end

  private

  def set_beer!
    @beer = Beer.find_by(bid: params[:bid].to_i) if params[:bid]
    return if @beer

    @beer = Beer.create!(beer_params)
  end

  def beer_params
    params.permit(
        :name,
        :kind,
        :description,
        :abv,
        :ibu,
        :logo_url,
        :beer_url,
        :brewery_name,
        :brewery_city,
        :brewery_country,
        :brewery_url,
        :bid,
    )
  end
end
