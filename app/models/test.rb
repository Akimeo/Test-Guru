# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :viewed_tests, dependent: :destroy
  has_many :users, through: :viewed_tests

  def self.sort_by_category(category)
    Test
      .joins(:category)
      .where('categories.title = ?', category)
      .order(title: :desc)
      .pluck(:title)
  end
end
