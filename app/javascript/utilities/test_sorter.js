class TestSorter {
  static sortTests() {
    document.addEventListener('turbolinks:load', function() {
      const control = document.querySelector('.sort-by-title')

      if (control) { control.addEventListener('click', TestSorter.sortRowsByTitle) }
    })
  }

  static sortRowsByTitle() {
    const table = document.querySelector('table')

    // NodeList
    // https://developer.mozilla.org/ru/docs/Web/API/NodeList
    const rows = table.querySelectorAll('tr')
    const sortedRows = []

    // select all table rows except the first one which is the header
    for (let i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i])
    }

    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      sortedRows.sort(TestSorter.compareRowsAsc)
      this.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
      sortedRows.sort(TestSorter.compareRowsDesc)
      this.querySelector('.octicon-arrow-down').classList.remove('hide')
      this.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    const sortedTable = document.createElement('table')

    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++) {
      sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
  }

  static compareRowsAsc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent
    const testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
  }

  static compareRowsDesc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent
    const testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
  }
}

export default TestSorter
