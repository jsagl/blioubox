import { Controller } from "stimulus";
import axios from "axios";
import {hideSpinner, toggleSpinner} from "../components/spinner";

export default class extends Controller {
    static targets = [
        'information',
        'name', 'kind', 'abv', 'brewery', 'logoUrl',
        'location', 'description', 'ibu',
        'nameForm', 'kindForm', 'breweryForm', 'logoUrlForm', 'beerUrlForm', 'abvForm',
        'breweryUrlForm', 'countryForm', 'cityForm', 'descriptionForm', 'ibuForm',
    ];

    prepareBeerInformation(event) {
        const beer = event._args[0]
        if (!this.informationTarget.classList.contains('hidden')) {
            this.hideBeer()
        }

        this.fetchBeerInformation(beer)
    }

    fillForm(beer) {

        this.nameFormTarget.value = beer['name']
        this.kindFormTarget.value = beer['kind']
        this.abvFormTarget.value = beer['abv']
        this.breweryFormTarget.value = beer['brewery']
        this.beerUrlFormTarget.value = beer['beer_url']
        this.logoUrlFormTarget.value = beer['logo_url']

        this.breweryUrlFormTarget.value = beer['brewery_page_url']
        this.countryFormTarget.value = beer['brewery_country']
        this.cityFormTarget.value = beer['brewery_city']
        this.descriptionFormTarget.value = beer['description']
        this.ibuFormTarget.value = beer['ibu']
    }

    presentBeer(beer) {
        this.nameTarget.innerHTML = beer['name']
        this.kindTarget.innerHTML = beer['kind']
        this.ibuTarget.innerHTML = beer['ibu'] == 0 ? `No IBU` : `${beer['ibu']} IBU`
        this.abvTarget.innerHTML = `${beer['abv']}%`
        this.descriptionTarget.innerHTML = beer['description']
        this.breweryTarget.innerHTML = beer['brewery']
        this.locationTarget.innerHTML = `${beer['brewery_city']}, ${beer['brewery_country']}`
        this.logoUrlTarget.src = beer['logo_url']
    }

    displayBeer() {
        this.informationTarget.classList.remove('hidden')
    }

    hideBeer() {
        this.informationTarget.classList.add('hidden')
    }

    fetchBeerInformation(beer) {
        const spinner = toggleSpinner(this.informationTarget)
        axios
            .get("/beers/external_beer_information", { params: beer })
            .then(
                (response) => {
                    const details = {...beer, ...response.data}
                    this.fillForm(details)
                    this.presentBeer(details)
                    hideSpinner(spinner)
                    this.displayBeer()
                }
            );
    }
}
