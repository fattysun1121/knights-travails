# frozen_string_literal: true


# need to remove coordinate that from result
def knight_moves(start, destination)
  move_vectors = [1, -1].product([2, -2]) + [2, -2].product([1, -1])
  current_level = 0
  coordinate_queue = [start]

  result = []

  
  coord_counter = 0
  pop_counts = []
  loop do
    coord = coordinate_queue.shift
    result << coord
    possible_coords = move_vectors.map do |v| # as in vector
      [v[0] + coord[0], v[1] + coord[1]]
    end.select do |c| # as in coordinate
      c[0] < 8 && c[0] >= 0 && c[1] < 8 && c[1] >= 0
    end
    pop_counts 
    coordinate_queue += possible_coords
    return result if coord == destination
  end
end


p knight_moves([0, 0], [2, 4])
