class BeersController < ApplicationController
  def external_beer_information
    # brewery_details = call_brewery_data_service(params[:brewery])
    # complementary_beer_information = parsed_beer_information(params[:beer_url])

    # render json: brewery_details.merge(complementary_beer_information)
    render json: {
        ibu: 10, description: "This is our unique version of an ancient style. A style as old as the ocean trade routes of the last centuries Great Ships. Not as old as the equator they had to cross twice enroute. Lagunitas IPA was our first seasonal way back in 1995. The recipe was formulated with malt and hops working together to balance it all out on your ‘buds so you can knock back more than one without wearing yourself out. Big on the aroma with a hoppy-sweet finish that’ll leave you wantin’ another sip.",
        brewery_city: 'Paris', brewery_country: 'France'
    }
  end

  private

  def permitted_params
    params.require(:beer).permit(
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
      :review,
      :rating,
    )
  end

  def call_brewery_data_service(query)
    BeerInformationProvider.brewery_information(query)
  end

  def parsed_beer_information(url)
    BeerInformationProvider.parsed_beer_information(url)
  end
end
