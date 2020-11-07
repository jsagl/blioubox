import { Controller } from "stimulus";
import axios from "axios";
import autocomplete from "autocomplete.js";

export default class extends Controller {
    static targets = ["field"];

    search(query, callback) {
        axios.get("/autocomplete", { params: { query } }).then((response) => {
            callback(response.data);
        });
        // callback([{beer_name: 'hello'}])
    }

    connect() {
        this.ac = autocomplete(this.fieldTarget, { hint: false }, [
            {
                source: this.search,
                debounce: 200,
                templates: {
                    suggestion: function (suggestion) {
                        return `${suggestion.name} - ${suggestion.brewery}`;
                    },
                },
            },
        ]).on("autocomplete:selected", (event, suggestion, dataset, context) => {
            this.ac.autocomplete.setVal('');
            this.fieldTarget.classList.add('hidden');
        });

        $('#searchBeerModal').on('hidden.bs.modal', (event) => {
            console.log(event.currentTarget.id)
            console.log(this.fieldTarget)
            this.fieldTarget.classList.remove('hidden');
        });
    }

}
