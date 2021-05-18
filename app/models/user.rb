# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_difficulty(level)
    Test
      .joins('JOIN viewed_tests ON tests.id = viewed_tests.test_id')
      .where('user_id = ? AND level = ?', id, level)
  end
end
