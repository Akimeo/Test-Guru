class PasswordChecker {
  static checkPassword(passwordFieldId, confirmationFieldId) {
    const password = document.getElementById(passwordFieldId)
    const confirmation = document.getElementById(confirmationFieldId)

    if (password && confirmation) {
      password.addEventListener('input', function() {
        PasswordChecker.comparePasswords(password, confirmation)
      })
      confirmation.addEventListener('input', function() {
        PasswordChecker.comparePasswords(password, confirmation)
      })
    }
  }

  static comparePasswords(password, confirmation) {
    switch(confirmation.value) {
      case '':
        document.querySelector('.octicon-check-circle-fill').classList.add('hide')
        document.querySelector('.octicon-x-circle-fill').classList.add('hide')
        break
      case password.value:
        document.querySelector('.octicon-check-circle-fill').classList.remove('hide')
        document.querySelector('.octicon-x-circle-fill').classList.add('hide')
        break
      default:
        document.querySelector('.octicon-check-circle-fill').classList.add('hide')
        document.querySelector('.octicon-x-circle-fill').classList.remove('hide')
    }
  }
}

export default PasswordChecker
