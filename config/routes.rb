Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'


  resources 'favorites', only: [:index, :create, :update, :destroy]

  resource 'autocomplete', only: [:show] do
    get '/beer_information', to: 'autocompletes#beer_information', on: :collection
  end
end
