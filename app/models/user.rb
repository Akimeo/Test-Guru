# frozen_string_literal: true

class User < ApplicationRecord
  has_many :viewed_tests, dependent: :destroy
  has_many :tests, through: :viewed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true

  def tests_by_level(level)
    tests.by_level(level)
  end

  def viewed_test(test)
    viewed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
