import { Controller } from "stimulus";
import axios from "axios";
import autocomplete from "autocomplete.js";

export default class extends Controller {
    static targets = ["field", "full", "cancel"];

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
                        return `
                        <div class="d-flex align-items-center">
                            <img src="${suggestion.logo_url}" alt="beer-logo" style="width: 20px; height: 20px; margin-left: -32px; margin-right: 10px"/>
                            <div>${suggestion.name} - ${suggestion.brewery}</div>
                        </div>
                        `;
                    },
                },
            },
        ]).on("autocomplete:selected", (event, suggestion, dataset, context) => {
            this.ac.autocomplete.setVal('');
            // this.fullTarget.classList.add('hidden');
        }).on("autocomplete:closed", (event, suggestion, dataset, context) => {
            this.cancelTarget.classList.add('search-cancel-hidden')
            this.ac.autocomplete.setVal('');
        }).on("autocomplete:opened", (event, suggestion, dataset, context) => {
            this.cancelTarget.classList.remove('search-cancel-hidden')
        });
    }

}
