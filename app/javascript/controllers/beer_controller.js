import { Controller } from "stimulus";
import axios from "axios";
import {hideSpinner, toggleSpinner} from "../components/spinner";

export default class extends Controller {
    static targets = [
        'information',
        'name', 'kind', 'abv', 'brewery', 'logoUrl', 'location', 'description', 'ibu',
        'bidForm'
    ];

    prepareBeerInformation(event) {
        const beer = event._args[0]
        if (!this.informationTarget.classList.contains('hidden')) {
            this.hideBeer()
        }

        this.fetchBeerInformation(beer)
    };

    showDetails(event) {
        const card = event.currentTarget.closest('.beer-card')
        const targets = card.querySelectorAll('.hidden-details')
        const caret = event.currentTarget.querySelector('svg')


        this.resizeCard(card)
        // this.toggleHiddenDetails(targets)
        this.toggleCaret(caret)
    }

    resizeCard(card) {
        if (card.classList.contains('beer-card-expanded')) {
            card.classList.remove('beer-card-expanded')
            card.classList.add('beer-card-retracted')
        } else {
            card.classList.remove('beer-card-retracted')
            card.classList.add('beer-card-expanded')
        }
    }

    toggleHiddenDetails(targets) {
        targets.forEach((target) => {
            target.classList.toggle('hidden')
        })
    }

    toggleCaret(caret) {
        if (caret.dataset.icon === 'angle-down') {
            caret.dataset.icon = 'angle-up'
        } else {
            caret.dataset.icon = 'angle-down'
        }
    }

    setExternalBeerId(beer) {
        this.bidFormTarget.value = beer['bid']
    }

    fillHTMLBeerDetails(beer) {
        this.nameTarget.innerHTML = beer['name']
        this.kindTarget.innerHTML = beer['kind']
        this.ibuTarget.innerHTML = beer['ibu'] == 0 ? `No IBU` : `${beer['ibu']} IBU`
        this.abvTarget.innerHTML = `${beer['abv']}%`
        this.descriptionTarget.innerHTML = beer['description']
        this.breweryTarget.innerHTML = beer['brewery_name']
        this.locationTarget.innerHTML = `${beer['brewery_city']}, ${beer['brewery_country']}`
        this.logoUrlTarget.src = beer['logo_url']
    }

    showBeer() {
        this.informationTarget.classList.remove('hidden')
    }

    hideBeer() {
        console.log('hello')
        if (!this.informationTarget.classList.contains('hidden')) {
            this.informationTarget.classList.add('hidden')
        }
    }

    fetchBeerInformation(beer) {
        const spinner = toggleSpinner(this.informationTarget)
        axios
            .get("/autocomplete/beer_information", { params: beer })
            .then(
                (response) => {
                    const details = response.data
                    this.setExternalBeerId(details)
                    this.fillHTMLBeerDetails(details)
                    hideSpinner(spinner)
                    this.showBeer()
                }
            );
    }
}
