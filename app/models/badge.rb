class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :image_name, presence: true
  validates :rule, presence: true

  RULES = [
    ['За прохождение теста с первой попытки', :first_attempt],
    ['За прохождение теста на 100%', :absolute_result],
    ['За прохождение всех тестов определенной категории', :category_all],
    ['За прохождение всех тестов определенного уровня', :level_all]
  ].freeze

  def self.find_value(params)
    case params[:rule]
    when 'category_all'
      params[:category_id]
    when 'level_all'
      params[:level]
    end
  end

  def description
    case rule
    when 'first_attempt'
      "Награда за прохождение теста с первой попытки"
    when 'absolute_result'
      "Награда за прохождение теста на 100%"
    when 'category_all'
      "Награда за прохождение всех тестов категории #{Category.find(value).title}"
    when 'level_all'
      "Награда за прохождение всех тестов уровня #{Test.difficulty(value)}"
    end
  end

  def self.give_badges(viewed_test)
    @viewed_test = viewed_test
    @user = viewed_test.user
    @badges = []
    Badge.all.each do |badge|
      send "#{badge.rule}_conditions", badge
    end
    @badges
  end

  private

  def self.first_attempt_conditions(badge)
    @badges.push(badge) if @user.tests.where('tests.id = ?', @viewed_test.test.id).count == 1 &&
                           @viewed_test.complete
  end

  def self.absolute_result_conditions(badge)
    @badges.push(badge) if @viewed_test.correct_answers_percent == 100
  end

  def self.category_all_conditions(badge)
    @badges.push(badge) if @user.has_not_one?(badge) &&
                           Test.all.by_category_id(badge.value).count ==
                           @user.viewed_tests.by_category_id(badge.value).complete_only.unique.count
  end

  def self.level_all_conditions(badge)
    @badges.push(badge) if @user.has_not_one?(badge) &&
                           Test.all.by_level(badge.value).count ==
                           @user.viewed_tests.by_level(badge.value).complete_only.unique.count
  end
end
