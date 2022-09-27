# frozen_string_literal: true

def knight_moves(start, destination)
  move_vectors = [1, -1].product([2, -2]) + [2, -2].product([1, -1])
  i = 0
  coordinate_queue = [start]

  loop do
    coord = coordinate_queue[i]
    i += 1

    # Generate possible coordinates, include parent coordinates.
    possible_coords = move_vectors.map do |v| # as in vector
      possible_coord = [v[0] + coord[0], v[1] + coord[1]]
      possible_coord += coord
    end
    # Filter out out of bounds coordinates.
    possible_coords = possible_coords.select do |c| # as in coordinate
      c[0] < 8 && c[0] >= 0 && c[1] < 8 && c[1] >= 0
    end

    coordinate_queue += possible_coords

    if coord[0] == destination[0] && coord[1] == destination[1]
      result = process_coordinate(coord) 
      print_result(result)
      return result
    end
  end
end

def process_coordinate(coord)
  result = []
  i = coord.length - 1
  while i >= 0
    result << [coord[i - 1], coord[i]]
    i -= 2
  end
  result
end

def print_result(result)
  puts "You made it in #{result.length} moves!  Here's your path:"
  result.each { |coord| p coord }
end

knight_moves([0, 0], [1, 2])
knight_moves([0, 0], [3, 3])
knight_moves([3, 3], [0, 0])
