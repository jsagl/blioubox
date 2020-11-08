require 'open-uri'

module BeerInformationProvider
  def self.key_beers_information(query)
    response = Faraday.post(
        "#{ENV['ALGOLIA_URL']}/beer/query?x-algolia-application-id=#{ENV['ALGOLIA_APPLICATION_ID']}&x-algolia-api-key=#{ENV['ALGOLIA_API_KEY']}",
      {params:"query=#{query}&hitsPerPage=5"}.to_json,
    )

    return [] unless response.success?

    JSON.parse(response.body)['hits']
  end

  def self.brewery_information(query)
    response = Faraday.post(
        "#{ENV['ALGOLIA_URL']}/brewery/query?x-algolia-application-id=#{ENV['ALGOLIA_APPLICATION_ID']}&x-algolia-api-key=#{ENV['ALGOLIA_API_KEY']}",
        {params:"query=#{query}&hitsPerPage=1"}.to_json,
    )

    return {} unless response.success?

    JSON.parse(response.body)['hits'].first
    # {}
  end

  def self.parsed_beer_information(url)
    document = Nokogiri::HTML.parse(URI.open(url))

    {
        description: document.css('.beer-descrption-read-less').inner_text[0...-11],
        ibu: document.css('.ibu').inner_text&.to_i,
    }
    # {description: 'blabla'}
  end
end
