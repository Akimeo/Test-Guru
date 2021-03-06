# frozen_string_literal: true

class ViewedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question
  before_save :before_save_set_complete_attribute

  scope :complete, -> { where(complete: true) }
  scope :by_category_id, -> (category_id) { joins(:test).where(tests: { category_id: category_id }) }
  scope :by_level, -> (level) { joins(:test).where(tests: { level: level }) }
  scope :no_repetitions, -> { select(:test_id).distinct }


  SUCCESS_RATIO = 85

  def completed?
    current_question.nil?
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

  def before_save_set_complete_attribute
    self.complete = passed?
  end
end
