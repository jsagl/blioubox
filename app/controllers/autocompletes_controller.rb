class AutocompletesController < ApplicationController
  def show
    beers = call_beer_data_service(params[:query])

    render json: partial_beers_presenter(beers)
  end

  def beer_information
    beer = Beer.find_by(bid: params[:bid].to_i) || create_beer

    render json: beer
  end

  private

  def call_beer_data_service(query)
    BeerInformationProvider.key_beers_information(query)
  end

  def partial_beers_presenter(beers)
    beers.map { |beer| partial_beer_presenter(beer) }
  end

  def partial_beer_presenter(beer)
    {
        name: beer['beer_name'],
        kind: beer['type_name'],
        logo_url: beer['beer_label'],
        bid: beer['bid'],
        beer_url: "https://untappd.com/b/#{beer['beer_index'].split(' ').join('-')}/#{beer['bid']}",
        brewery: beer['brewery_name'],
        brewery_id: beer['brewery_id'],
        abv: beer['beer_abv'],
    }
  end

  def create_beer
    brewery_details = call_brewery_data_service(params[:brewery])
    complementary_beer_information = complementary_beer_information(params[:beer_url])
    Beer.create!(base_beer_params.merge(brewery_details, complementary_beer_information))
  end

  def base_beer_params
    permitted_params = params.permit(
        :bid,
        :name,
        :kind,
        :abv,
        :logo_url,
        :beer_url,
        :brewery,
        :brewery_id,
    )

    {
        bid: permitted_params[:bid]&.to_i,
        name: permitted_params[:name],
        kind: permitted_params[:kind],
        abv: permitted_params[:abv]&.to_f,
        logo_url: permitted_params[:logo_url],
        beer_url: permitted_params[:beer_url],
        brewery_name: permitted_params[:brewery],
        external_brewery_id: permitted_params[:brewery_id]&.to_i,
    }
  end

  def call_brewery_data_service(query)
    BeerInformationProvider.brewery_information(query)
  end

  def complementary_beer_information(url)
    BeerInformationProvider.parsed_beer_information(url)
  end
end