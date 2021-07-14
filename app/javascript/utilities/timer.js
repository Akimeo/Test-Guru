class Timer {
  constructor(timerId) {
    this.timer = document.getElementById(timerId)
  }

  start() {
    if (this.timer) {
      let remainingTime = this.timer.dataset.duration

      SetInterval(function() {
        this.timer.textContent = 'Оставшееся время: ' + remainingTime
        remainingTime--
        console.log(this.timer)

        if (remainingTime == 0) {
          this.timer.textContent = 'Конец'
        }
      }, 1000)
    }
  }

}

export default Timer
