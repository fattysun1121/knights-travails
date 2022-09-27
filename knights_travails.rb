# frozen_string_literal: true


# need to remove coordinate from result
def knight_moves(start, destination)
  move_vectors = [1, -1].product([2, -2]) + [2, -2].product([1, -1])
  i = 0
  coordinate_queue = [start]


  loop do
    coord = coordinate_queue[i]
    i += 1
    
    # generate possible coordinates, include parent coords
    possible_coords = move_vectors.map do |v| # as in vector
      possible_coord = [v[0] + coord[0], v[1] + coord[1]]
      possible_coord += coord
    end
    
    # filter out out of bounds coordinates 
    possible_coords = possible_coords.select do |c| # as in coordinate
      c[0] < 8 && c[0] >= 0 && c[1] < 8 && c[1] >= 0
    end

  

    coordinate_queue += possible_coords
    return coord if coord[0] == destination[0] && coord[1] == destination[1]

  end
end


p knight_moves([0, 0], [2, 4])


# need something to hold previous coord
# use a diff variable to traceback to the previous coord
# coords_in_levels array to keep track of the count of coordinates
# coordinate_queue[]
