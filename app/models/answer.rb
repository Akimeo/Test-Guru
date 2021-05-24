# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :correct, inclusion: { in: [true, false] }
  validate :validate_number_of_answers

  private

  def validate_number_of_answers
    message = :too_many_answers
    errors.add(:question, message) if !question.nil? && question.answers.count >= 4
  end
end
