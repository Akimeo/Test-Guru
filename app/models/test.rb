# frozen_string_literal: true

class Test < ApplicationRecord
  def self.sort_by_category(category)
    Test.where(category_id: Category.find_by(title: category)).map(&:title).sort.reverse
  end
end
