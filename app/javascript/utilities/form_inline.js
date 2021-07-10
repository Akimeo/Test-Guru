class FormInline {
  static doStuff() {
    const links = document.querySelectorAll('.form-inline-link')

    if (links.length) {
      for (let i = 0; i < links.length; i++) {
        links[i].addEventListener('click', FormInline.linkHandler)
      }

      const errors = document.querySelector('.resource-errors')

      if (errors) {
        const resourceId = errors.dataset.resourceId
        FormInline.handler(resourceId)
      }
    }
  }

  static linkHandler(event) {
    event.preventDefault()

    const testId = this.dataset.testId
    FormInline.handler(testId)
  }

  static handler(testId) {
    const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    const testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    const formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

    if (formInline.classList.contains('hide')) {
      testTitle.classList.add('hide')
      formInline.classList.remove('hide')
      link.textContent = 'Cancel'
    } else {
      testTitle.classList.remove('hide')
      formInline.classList.add('hide')
      link.textContent = 'Edit'
    }
  }
}

export default FormInline
