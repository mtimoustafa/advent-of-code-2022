module Puzzles
  module Two
    def self.assumed_outcome_scores
      {
        'A Z' => 0,
        'B X' => 0,
        'C Y' => 0,
        'A X' => 3,
        'B Y' => 3,
        'C Z' => 3,
        'A Y' => 6,
        'B Z' => 6,
        'C X' => 6
      }
    end

    def self.assumed_shape_scores
      {
        'X' => 1,
        'Y' => 2,
        'Z' => 3
      }
    end

    def self.actual_outcome_scores
      {
        'X' => 0,
        'Y' => 3,
        'Z' => 6
      }
    end

    def self.actual_shape_scores
      {
        'B X' => 1,
        'A Y' => 1,
        'C Z' => 1,
        'C X' => 2,
        'B Y' => 2,
        'A Z' => 2,
        'A X' => 3,
        'C Y' => 3,
        'B Z' => 3
      }
    end
  end

  def self.two(data:)
    rounds = data.split("\n")

    assumed_scores = rounds.map { |round| Two.assumed_outcome_scores[round] + Two.assumed_shape_scores[round[-1]] }
    true_scores = rounds.map { |round| Two.actual_outcome_scores[round[-1]] + Two.actual_shape_scores[round] }

    return {
      part_one: assumed_scores.sum,
      part_two: true_scores.sum
    }
  end
end
