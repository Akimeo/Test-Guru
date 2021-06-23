module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :normal, 2 => :hard, 3 => :expert }.freeze

  def test_level(test)
    TEST_LEVELS.fetch(test.level, :insane)
  end
end
