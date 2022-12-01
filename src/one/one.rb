module Puzzles
  def self.one(data:)
    elves = data.split("\n\n").map(&:split)
    elf_calories = elves.map { |elf| elf.map(&:to_i).sum }

    return {
      part_one: elf_calories.max,
      part_two: elf_calories.sort[-3..-1].sum
    }
  end
end
