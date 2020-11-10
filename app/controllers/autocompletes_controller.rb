class AutocompletesController < ApplicationController
  def show
    beers = call_beer_data_service(params[:query])

    render json: partial_beers_presenter(beers)
  end

  def beer_information
    beer = Beer.find_by(bid: params[:bid].to_i) if params[:bid]

    unless beer
      brewery_details = call_brewery_data_service(params[:brewery])
      complementary_beer_information = complementary_beer_information(params[:beer_url])
      beer = Beer.create!(base_beer_params.merge(brewery_details, complementary_beer_information))
    end

    render json: beer
    # render json: {
    #     ibu: 10, description: "This is our unique version of an ancient style. A style as old as the ocean trade routes of the last centuries Great Ships. Not as old as the equator they had to cross twice enroute. Lagunitas IPA was our first seasonal way back in 1995. The recipe was formulated with malt and hops working together to balance it all out on your ‘buds so you can knock back more than one without wearing yourself out. Big on the aroma with a hoppy-sweet finish that’ll leave you wantin’ another sip.",
    #     brewery_city: 'Paris', brewery_country: 'France'
    # }
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

# {
#     "bid": 77637,
#     "beer_abv": 12.1,
#     "beer_name": "Big Bad Baptist",
#     "beer_index": "epic brewing co utah colorado big bad baptist",
#     "brewery_label": "https://untappd.akamaized.net/site/brewery_logos/brewery-EpicBrewingCo_7216.jpeg",
#     "brewery_name": "Epic Brewing Co. (Utah, Colorado)",
#     "brewery_id": 7216,
#     "type_name": "Stout - Imperial / Double Coffee",
#     "type_id": 327,
#     "homebrew": 0,
#     "in_production": 1,
#     "popularity": 156770,
#     "alias_alt": [
#         "exponential big bad baptist",
#         "big bad baptist withwhiskey chips",
#         "nitro big bad baptist",
#         "big bad baptist w cacao nibs and coffee beans",
#         "epic big bad baptista imperial stout",
#         "big bad baptist imperial stout",
#         "epic big bad baptist whiskey barrel aged",
#         "big bad baptist exponential series"
#     ],
#     "spelling_alt": [],
#     "brewery_alias": [],
#     "beer_label": "https://untappd.akamaized.net/site/beer_logos/beer-77637_822c2_sm.jpeg",
#     "beer_index_short": "epicbrewingcoutahcoloradobigbadbaptist",
#     "beer_name_sort": "Big Bad Baptist",
#     "brewery_name_sort": "Epic Brewing Co. (Utah, Colorado)",
#     "rating_score": 4.19383,
#     "rating_count": 108857,
#     "brewery_beer_name": "Epic Brewing Co. (Utah, Colorado) Big Bad Baptist",
#     "index_date": "2020-11-06 10:58:20",
#     "objectID": "77637",
# }