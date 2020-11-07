Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'beers#index'

  resources 'beers' do
    get '/external_beer_information', to: 'beers#external_beer_information', on: :collection
  end

  resource 'autocomplete', only: [:show]
end
