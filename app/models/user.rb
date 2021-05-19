# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewed_tests, dependent: :destroy
  has_many :tests, through: :viewed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  def tests_by_level(level)
    tests.where('level = ?', level)
  end
end
