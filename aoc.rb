Dir['src/**/*.rb'].each { |file| require_relative file }

MODES = [:real, :test]

if ARGV.length < 1 || ARGV.length > 2
  pp 'Usage: ruby aoc.rb <puzzle-number (e.g. two)> <real|test (default: real)>'
  exit 1
end

puzzle_number = ARGV[0].strip.to_sym
unless Puzzles.respond_to?(puzzle_number)
  pp "Puzzle '#{puzzle_number}' not found"
  exit 1
end


mode = ARGV[1]&.strip&.to_sym || :real
unless MODES.include?(mode)
  pp "Incorrect mode '#{mode}'"
  exit 1
end

data_path = File.expand_path("src/#{puzzle_number}/data/#{mode}.txt")
result = Puzzles.send(puzzle_number, :data => File.open(data_path).read)

puts 'Part 1 result:'
pp result[:part_one]
puts 'Part 2 result:'
pp result[:part_two]
