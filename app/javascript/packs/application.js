// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import TableSorter from "utilities/table_sorter"
import PasswordChecker from "utilities/password_checker"
import FormInline from "solutions/form_inline"
import ProgressBar from "utilities/progress_bar"
import BadgeFormHandler from "solutions/badge_form_handler"


document.addEventListener('turbolinks:load', function() {
  FormInline.setEventListeners()
  BadgeFormHandler.handleForm()

  TableSorter.sortTable("admin_tests", "category")
  TableSorter.sortTable("admin_tests", "title")
  TableSorter.sortTable("user_tests", "category")
  TableSorter.sortTable("user_tests", "title")
  PasswordChecker.checkPassword("new_password", "new_password_confirmation")

  const progressBar = new ProgressBar("test_progress_bar")

  progressBar.trackProgress()
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()
