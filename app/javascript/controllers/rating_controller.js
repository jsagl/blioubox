import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [
        'one', 'two', 'three', 'four', 'five', 'form', 'submitButton'
    ]

    rate(event) {
        event.preventDefault();

        const stars = this.stars();
        const clickedStar = event.currentTarget;
        const index = stars.findIndex(star => star === clickedStar)
        const rating = index + 1

        stars.slice(0, index + 1).forEach(star => star.children[0].dataset.prefix = 'fa')
        stars.slice(index + 1).forEach(star => star.children[0].dataset.prefix = 'far')

        this.formTarget.value = rating
        this.submitButtonTarget.disabled = false
    }

    resetStars() {
        const stars = this.stars();

        stars.forEach(star => star.children[0].dataset.prefix = 'far')

        this.submitButtonTarget.disabled = true
        this.formTarget.value = null
    }

    stars() {
        return [this.oneTarget, this.twoTarget, this.threeTarget, this.fourTarget, this.fiveTarget]
    }
}
