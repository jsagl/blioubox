import { Controller } from "stimulus"
import Typed from 'typed.js';

export default class extends Controller {
    static targets = [ "typedStrings" ]

    loadDynamicBannerText = (elementId) => {
        new Typed('#typed', {
            stringsElement: elementId,
            typeSpeed: 70,
            backDelay: 5000,
            loop: true,
            showCursor: true,
        });
    }

    connect() {
        this.loadDynamicBannerText(`#${this.typedStringsTarget.id}`)
    }
}
