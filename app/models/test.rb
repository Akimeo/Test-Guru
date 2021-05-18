# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :viewed_tests
  has_many :users, through: :viewed_tests

  def self.sort_by_category(category)
    Test
      .joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title = ?', category)
      .order('tests.title DESC')
      .pluck(:title)
  end
end
