class BadgeService
  def initialize(viewed_test)
    @viewed_test = viewed_test
    @user = viewed_test.user
    @test = viewed_test.test
    @badges = []
  end

  def call
    Badge.select do |badge|
      send "#{badge.rule}_conditions", badge
    end
  end

  private

  def first_attempt_conditions(badge)
    @badges.push(badge) if @viewed_test.complete &&
                           @user.tests.where(tests: { id: @test.id }).count == 1
    end

  def absolute_result_conditions(badge)
    @badges.push(badge) if @viewed_test.correct_answers_percent == 100
  end

  def category_all_conditions(badge)
    @badges.push(badge) if @user.has_not_one?(badge) &&
                           Test.all.by_category_id(badge.value).count ==
                           @user.viewed_tests.by_category_id(badge.value).complete.no_repetitions.count
  end

  def level_all_conditions(badge)
    @badges.push(badge) if @user.has_not_one?(badge) &&
                           Test.all.by_level(badge.value).count ==
                           @user.viewed_tests.by_level(badge.value).complete.no_repetitions.count
  end
end
