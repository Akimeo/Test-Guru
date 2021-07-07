class PasswordChecker {
  static checkPassword() {
    document.addEventListener('turbolinks:load', function() {
      const password = document.querySelector('.password')
      const confirm = document.querySelector('.password-confirmation')

      if (password && confirm) {
        password.addEventListener('input', PasswordChecker.comparePasswords)
        confirm.addEventListener('input', PasswordChecker.comparePasswords)
      }
    })
  }

  static comparePasswords() {
    const password = document.querySelector('.password').value
    const confirm = document.querySelector('.password-confirmation').value

    switch(confirm) {
      case '':
        document.querySelector('.octicon-check-circle-fill').classList.add('hide')
        document.querySelector('.octicon-x-circle-fill').classList.add('hide')
        break
      case password:
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
