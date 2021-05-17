# frozen_string_literal: true

class Test < ApplicationRecord
  def self.sort_by_category(category)
    Test
      .joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title = ?', category)
      .order('tests.title DESC')
      .pluck(:title)
  end
end
