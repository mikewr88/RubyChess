require "byebug"
module Sliding

DIAGONAL_MOVES = [[-1,-1], [1,1], [1,-1], [-1,1]]
LINEAR_MOVES = [[0,1], [1,0], [-1,0], [0,-1]]

 # def moves
 #   moves = []
 #   move_dirs.each do |dx, dy|
 #     moves.concat(grow_unblocked_moves_in_dir(dx,dy))
 #   end
 #   moves
 # end

  def grow_unblocked_moves_in_dir(dx,dy)
    x, y = current_pos #####

    possible_dirs = []
    loop do                      # while  [x, y].all? { |x| x.between?(0,6)}
      x += dx
      y += dy
      break unless valid_move?(current_pos, [x,y])
      possible_dirs << [x,y]

    end
    possible_dirs

  end


end
