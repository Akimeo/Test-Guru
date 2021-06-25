module ViewedTestsHelper
  def current_question_number(viewed_test)
    viewed_test.test.questions.order(:id).where('id <= ?', viewed_test.current_question).count
  end
end
