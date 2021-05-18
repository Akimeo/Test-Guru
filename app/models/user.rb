# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewed_tests
  has_many :tests, through: :viewed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_difficulty(level)
    Test
      .joins('JOIN viewed_tests ON tests.id = viewed_tests.test_id')
      .where('user_id = ? AND level = ?', id, level)
  end
end
