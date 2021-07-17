class Specifications::Badges::FirstAttemptPassage
  def self.satisfied_by?(viewed_test, badge)
    viewed_test.complete && viewed_test.user.tests.where(tests: { id: viewed_test.test.id }).count == 1
  end
end
