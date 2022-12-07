module Puzzles
  module Four
    def self.isContained(pair1, pair2)
      (pair1[0] <= pair2[0] && pair1[1] >= pair2[1]) ||
      (pair1[0] >= pair2[0] && pair1[1] <= pair2[1])
    end

    def self.isOverlapping(pair1, pair2)
      (pair1[0] >= pair2[0] && pair1[0] <= pair2[1]) ||
      (pair1[1] >= pair2[0] && pair1[1] <= pair2[1])
    end
  end
  
  def self.four(data:)
    assignment_pairs = data.split("\n").map { |pair| pair.split(',').map { |assignment| assignment.split('-').map(&:to_i) } }

    contained_assignments_count = assignment_pairs.count do |assignment_pair|
      Four.isContained(assignment_pair[0], assignment_pair[1])
    end

    overlapping_assignments_count = assignment_pairs.count do |assignment_pair|
      Four.isOverlapping(assignment_pair[0], assignment_pair[1]) ||
        Four.isContained(assignment_pair[0], assignment_pair[1])
    end

    return {
      part_one: contained_assignments_count,
      part_two: overlapping_assignments_count
    }
  end
end
