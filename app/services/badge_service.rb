class BadgeService
  def initialize(viewed_test)
    @viewed_test = viewed_test
    @user = viewed_test.user
  end

  def call
    Badge.select do |badge|
      @user.badges.push(badge) if "Specifications::Badges::#{badge.rule.camelize}".constantize.satisfied_by?(
        @viewed_test, badge
      )
    end
  end
end
