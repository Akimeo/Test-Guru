class Specifications::Badges::AllTestsByLevel
  def self.satisfied_by?(viewed_test, badge)
    viewed_test.user.has_not_one?(badge) &&
    Test.all.by_level(badge.rule_value).count ==
    viewed_test.user.viewed_tests.by_level(badge.rule_value).complete.no_repetitions.count
  end
end
