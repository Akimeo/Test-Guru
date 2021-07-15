# frozen_string_literal: true

class ViewedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  SUCCESS_RATIO = 85

  def completed?
    current_question.nil? || time_is_over?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question).count
  end

  def correct_answers_percent
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  def passed?
    correct_answers_percent >= SUCCESS_RATIO
  end

  def progress_percent
    ((current_question_number - 1).to_f / test.questions.count * 100).to_i
  end

  def finish_time
    created_at + test.duration.seconds
  end

  def remaining_time
    (finish_time - Time.current).to_i
  end

  def time_is_over?
    Time.current > finish_time
  end

  private

  def before_validation_set_question
    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              test.questions.order(:id).where('id > ?', current_question.id).first
                            end
  end

  def correct_answer?(answer_ids=[])
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.right
  end
end
