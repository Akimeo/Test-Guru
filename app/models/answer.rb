# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :correct, inclusion: { in: [true, false] }
  validate :validate_number_of_answers, on: :create

  private

  def validate_number_of_answers
    errors.add(:question, :too_many_answers) if question.answers.count >= 4
  end
end
