import { Controller } from "stimulus"
import Typed from 'typed.js';

let typedInstance = null

export default class extends Controller {
    static targets = [ "typedStrings" ]

    loadDynamicBannerText = (elementId) => {
        typedInstance = new Typed('#typed', {
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

    disconnect() {
        typedInstance.destroy()
    }
}
