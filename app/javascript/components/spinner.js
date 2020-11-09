function toggleSpinner(hidden_target) {
    const parent = hidden_target.parentNode
    let spinner = parent.querySelector('.spinner-border')

    if (spinner && spinner.classList.contains('hidden')) {
        spinner.classList.remove('hidden')
    }

    if (!spinner) {
        parent.innerHTML += '' +
            '<div class="d-flex w-100 align-items-center justify-content-center">' +
                '<div class="spinner-border text-primary" role="status">' +
                    '<span class="sr-only">Loading...</span>' +
                '</div>' +
            '</div>'
        spinner = parent.querySelector('.spinner-border')
    }

    return spinner
}

function hideSpinner(spinner) {
    spinner.classList.add('hidden');
}

export { toggleSpinner, hideSpinner }