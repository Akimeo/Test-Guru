class TableSorter {
  static sortTable(tableId, headerId) {
    document.addEventListener('turbolinks:load', function() {
      const table = document.getElementById(tableId)

      if (table) {
        const header = table.rows[0].cells.namedItem(headerId)

        if (header) {
          header.classList.add('pointer')
          header.addEventListener('click', function() {
            TableSorter.sortRows(table, header)
          })
        }
      }
    })
  }

  static sortRows(table, header) {
    let sortedRows = Array.from(table.rows).slice(1)

    if (header.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      sortedRows.sort((rowA, rowB) => rowA.cells[header.cellIndex].innerHTML >
                                      rowB.cells[header.cellIndex].innerHTML ? 1 : -1)
      TableSorter.hideAllArrows(table)
      header.querySelector('.octicon-arrow-up').classList.remove('hide')
    } else {
      sortedRows.sort((rowA, rowB) => rowA.cells[header.cellIndex].innerHTML >
                                      rowB.cells[header.cellIndex].innerHTML ? -1 : 1)
      TableSorter.hideAllArrows(table)
      header.querySelector('.octicon-arrow-down').classList.remove('hide')
    }

    table.tBodies[0].append(...sortedRows)
  }

  static hideAllArrows(table) {
    table.querySelectorAll('.octicon-arrow-up').forEach(function(octiconArrow) {
      octiconArrow.classList.add('hide')
    })
    table.querySelectorAll('.octicon-arrow-down').forEach(function(octiconArrow) {
      octiconArrow.classList.add('hide')
    })
  }
}

export default TableSorter
