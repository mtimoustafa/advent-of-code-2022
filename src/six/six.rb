module Puzzles
  module Six
    def self.marker_windows
      {
        :packet => 4,
        :message => 14
      }
    end

    def self.scan_stream(data:, marker:)
      position = 1
      window = []
      window_map = {}

      data.chars.each do |character|
        window << character
        window_map[character] ||= 0
        window_map[character] += 1

        next position += 1 if position <= self.marker_windows[marker]

        ejected_character = window.shift
        window_map[ejected_character] -= 1

        break unless window_map.any? { |character, occurence| occurence > 1 }

        position += 1
      end

      return position
    end
  end
  
  def self.six(data:)
    return {
      part_one: Six.scan_stream(data: data, marker: :packet),
      part_two: Six.scan_stream(data: data, marker: :message)
    }
  end
end
