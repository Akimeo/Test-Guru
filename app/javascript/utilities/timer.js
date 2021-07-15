class Timer {
  constructor(timerId, formId) {
    this.timer = document.getElementById(timerId)
    this.form = document.getElementById(formId)
  }

  start() {
    if (this.timer && this.form) {
      let remainingTime = this.timer.dataset.remainingTime

      const tick = setInterval(() => {
        this.timer.textContent = 'Оставшееся время: ' + Timer.formatTime(remainingTime)
        remainingTime--
      }, 1000)

      setTimeout(() => {
        clearInterval(tick)
        alert('Time is over!')
        this.form.submit()
      }, remainingTime * 1000)
    }
  }

  static formatTime(time) {
    const hours = Math.floor(time / 3600)
    const minutes = Math.floor(time / 60)
    const seconds = time % 60
    return hours + ':' + minutes + ':' + seconds
  }
}

export default Timer
