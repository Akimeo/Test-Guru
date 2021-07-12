class ProgressBar {
  constructor(progressBarId) {
    this.progressBar = document.getElementById(progressBarId)
  }

  trackProgress() {
    if (this.progressBar) {
      const progress = this.progressBar.dataset.progress
      this.progressBar.style.width = progress + "%"
    }
  }
}

export default ProgressBar
