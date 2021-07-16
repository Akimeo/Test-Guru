class Specifications::Badges::AbsoluteTestResult
  def self.satisfied_by?(viewed_test, badge)
    viewed_test.correct_answers_percent == 100
  end
end
