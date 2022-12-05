module Puzzles
  module Three
    def self.priority_score(item_type)
      item_type.ord <= 'Z'.ord ? item_type.ord - 'A'.ord + 27 : item_type.ord - 'a'.ord + 1
    end
  end
  
  def self.three(data:)
    rucksacks = data.split("\n")

    priorities = rucksacks.map do |rucksack|
      compartment_length = (rucksack.length / 2.0).ceil

      duplicates = rucksack.chars[0..compartment_length-1] & rucksack.chars[compartment_length..]
      duplicates.reduce(0) { |sum, duplicate| sum += Three.priority_score(duplicate) }
    end

    badges = []
    rucksacks.each_slice(3) do |rucksack_group|
      badge = rucksack_group.map(&:chars).reduce(:&).join
      badges << Three.priority_score(badge)
    end

    return {
      part_one: priorities.sum,
      part_two: badges.sum
    }
  end
end
