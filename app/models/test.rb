# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :viewed_tests, dependent: :destroy
  has_many :users, through: :viewed_tests

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }
  scope :by_level, -> (level) { where(level: level) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }
  scope :by_category_id, -> (category_id) { where(category_id: category_id) }

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, presence: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  def self.sort_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
