# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :viewed_tests, dependent: :destroy
  has_many :users, through: :viewed_tests

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, -> (level) { where('level = ?', level) }
  scope :by_category, -> (category) { joins(:category).
                                      where('categories.title = ?', category).
                                      order(title: :desc) }

  def self.sort_by_category(category)
    Test.by_category(category).pluck(:title)
  end
end
