class BadgeFormHandler {
  static handleForm() {
    const badgeRule = document.getElementById('badge_rule')

    if (badgeRule) {
      badgeRule.addEventListener('click', BadgeFormHandler.showValue)
    }
  }

  static showValue() {
    const categoryValue = document.getElementById('category_value')
    const levelValue = document.getElementById('level_value')

    switch(this.value) {
      case 'category_all':
        categoryValue.classList.remove('hide')
        levelValue.classList.add('hide')
        break
      case 'level_all':
        categoryValue.classList.add('hide')
        levelValue.classList.remove('hide')
        break
      default:
        categoryValue.classList.add('hide')
        levelValue.classList.add('hide')
    }
  }
}

export default BadgeFormHandler
