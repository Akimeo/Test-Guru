# frozen_string_literal: true

class User < ApplicationRecord
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  has_many :viewed_tests, dependent: :destroy
  has_many :tests, through: :viewed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: EMAIL_FORMAT }

  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def tests_by_level(level)
    tests.by_level(level)
  end

  def viewed_test(test)
    viewed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
