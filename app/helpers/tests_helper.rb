module TestsHelper
  DIFFICULTIES = { 0 => :easy, 1 => :normal, 2 => :hard, 3 => :expert }.freeze

  def difficulty(level)
    DIFFICULTIES.fetch(level.to_i, :insane)
  end
end
