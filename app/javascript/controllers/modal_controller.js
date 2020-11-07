import { Controller } from "stimulus";
import axios from "axios";
import autocomplete from "autocomplete.js";

export default class extends Controller {
    static targets = ['name', 'kind', 'brewery', 'breweryUrl', 'country', 'city', 'description', 'abv', 'ibu', 'logoUrl', 'beerUrl'];

    fill(event) {
        axios.get("/beers/external_beer_information", { params: event._args[0] }).then((response) => {
            console.log(response.data)
            this.breweryUrlTarget.value = response.data['brewery_page_url']
            this.countryTarget.value = response.data['brewery_country']
            this.cityTarget.value = response.data['brewery_city']
            this.descriptionTarget.value = response.data['description']
            this.ibuTarget.value = response.data['ibu']
        });

        this.nameTarget.value = event._args[0]['name']
        this.kindTarget.value = event._args[0]['kind']
        this.abvTarget.value = event._args[0]['abv']
        this.breweryTarget.value = event._args[0]['brewery']
        this.beerUrlTarget.value = event._args[0]['beer_url']
        this.logoUrlTarget.value = event._args[0]['logo_url']
    }

    append(event) {
        console.log(event)
    }
}
