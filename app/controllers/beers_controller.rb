class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def create
    beer = Beer.create!(permitted_params)
    render json: beer.to_json
  end

  def external_beer_information
    brewery_details = call_brewery_data_service(params[:brewery])
    complementary_beer_information = parsed_beer_information(params[:beer_url])

    render json: brewery_details.merge(complementary_beer_information)
  end

  private

  def permitted_params
    params.require(:beer).permit(:name)
  end

  def selected_beer_params
    params.permit(
      :name,
      :kind,
      :bid,
      :logo_url,
      :beer_url,
      :brewery,
      :brewery_id,
      :abv,
    )
  end

  def call_brewery_data_service(query)
    BeerInformationProvider.brewery_information(query)
  end

  def parsed_beer_information(url)
    BeerInformationProvider.parsed_beer_information(url)
  end
end
