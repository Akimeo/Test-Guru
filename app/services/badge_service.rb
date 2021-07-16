class BadgeService
  def initialize(viewed_test)
    @viewed_test = viewed_test
  end

  def call
    Badge.select do |badge|
      "Specifications::Badges::#{badge.rule.camelize}".constantize.satisfied_by?(@viewed_test, badge)
    end
  end
end
