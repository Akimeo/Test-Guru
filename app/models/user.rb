# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_difficulty(level)
    Test.where(level: level)
  end
end
