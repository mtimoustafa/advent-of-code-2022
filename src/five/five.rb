module Puzzles
  module Five
    def self.create_stack(stack_data:)
      stack = nil

      stack_data.split("\n").reverse.each_with_index do |line, index|
        next stack = Array.new(line.scan(/[0-9]/).length) { Array.new } if index === 0

        line.scan(/\s{4}|\[[A-Z]\]/).each_with_index do |element, line_index|
          element = element.gsub(/[\[\]]/, '').strip
          stack[line_index] << element unless element.empty?
        end
      end

      return stack
    end

    def self.move_crates(stack:, instructions:, multi_crate: false)
      instructions.split("\n").each_with_index do |instruction, index|
        quantity, source, destination = instruction.scan(/[0-9]+/).map(&:to_i)

        crates_to_move = stack[source - 1].pop(quantity)
        crates_to_move.reverse! unless multi_crate

        stack[destination - 1].concat(crates_to_move)
      end

      return stack
    end

    def self.stack_tops(stack:)
      stack.map(&:last).join
    end
  end
  
  def self.five(data:)
    stack_data, instructions = data.split("\n\n")

    stack_9000 = Five.create_stack(stack_data: stack_data)
    stack_9001 = Marshal.load(Marshal.dump(stack_9000))

    stack_9000 = Five.move_crates(stack: stack_9000, instructions: instructions)
    stack_9001 = Five.move_crates(stack: stack_9001, instructions: instructions, multi_crate: true)

    return {
      part_one: Five.stack_tops(stack: stack_9000),
      part_two: Five.stack_tops(stack: stack_9001)
    }
  end
end
