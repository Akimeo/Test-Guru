document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('.password')
  var confirm = document.querySelector('.password-confirmation')

  if (password && confirm) {
    password.addEventListener('input', comparePasswords)
    confirm.addEventListener('input', comparePasswords)
  }
})

function comparePasswords() {
  var password = document.querySelector('.password').value
  var confirm = document.querySelector('.password-confirmation').value

  if (confirm == '') {
    document.querySelector('.octicon-check-circle-fill').classList.add('hide')
    document.querySelector('.octicon-x-circle-fill').classList.add('hide')
  } else if (password == confirm) {
    document.querySelector('.octicon-check-circle-fill').classList.remove('hide')
    document.querySelector('.octicon-x-circle-fill').classList.add('hide')
  } else {
    document.querySelector('.octicon-check-circle-fill').classList.add('hide')
    document.querySelector('.octicon-x-circle-fill').classList.remove('hide')
  }
}
