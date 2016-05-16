require 'byebug'

module Stepping


  KING_MOVES = [[-1,-1],[1,1],[1,-1],[-1,1],[0,1],[1,0],[-1,0],[0,-1]]
  KNIGHT_MOVES = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]

  def grow_unblocked_moves_in_dir(dx,dy)

    x, y = current_pos
    possible_dirs = []

      x += dx
      y += dy

      if valid_move?(current_pos, [x,y])
        possible_dirs << [x,y]
      end

    possible_dirs
  end

end
