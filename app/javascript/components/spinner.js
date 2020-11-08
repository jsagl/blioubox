function toggleSpinner(hidden_target) {
    const parent = hidden_target.parentNode
    let spinner = parent.querySelector('.spinner-border')

    if (spinner && spinner.classList.contains('hidden')) {
        spinner.classList.remove('hidden')
    }

    if (!spinner) {
        parent.innerHTML += '' +
            '<div class="spinner-border text-primary" role="status" data-target="modal.spinner">' +
                '<span class="sr-only">Loading...</span>' +
            '</div>'
        spinner = parent.querySelector('.spinner-border')
    }


    setTimeout(
        () => {
            spinner.classList.add('hidden');
            $(`#${hidden_target.id}`)[0].classList.remove('hidden')
        },
        1000
    )
}

export { toggleSpinner }