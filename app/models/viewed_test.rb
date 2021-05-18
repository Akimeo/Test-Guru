# frozen_string_literal: true

class ViewedTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
