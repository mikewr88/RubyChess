class Pawn < Piece

  WHITE_PAWN_MOVES = [[1, 0],[2, 0],[1, -1],[1, 1]]
  BLACK_PAWN_MOVES = [[-1,0],[-2, 0],[-1,-1],[-1,1]]

  def regular_valid_move?(current_pos, new_pos)
    if @board.in_bounds?(new_pos) && @board[new_pos].empty?
      true
    else
      false
    end
  end

  def moves
    pawn_moves = []
    if self.color == :white
      WHITE_PAWN_MOVES.each do |dx, dy|
        pawn_moves.concat(build_moves(dx, dy))
      end
    else
      BLACK_PAWN_MOVES.each do |dx, dy|
        pawn_moves.concat(build_moves(dx, dy))
      end
    end
    pawn_moves
  end

  def build_moves(dx, dy)
    x,y = current_pos
    possible_dirs = []
    x += dx
    y += dy

    if (dx.abs == 1 && dy == 0) && regular_valid_move?(current_pos, [x, y])
      possible_dirs << [x, y]
    elsif dx.abs == 2 && dy == 0 && regular_valid_move?(current_pos, [x, y]) &&
      (current_pos[0] == 1 || current_pos[0] == 6)
      possible_dirs << [x, y]
    elsif dy.abs == 1 && valid_move?(current_pos, [x, y]) && !@board[[x,y]].empty? && (@board[[x,y]].color != @board[current_pos].color)
      possible_dirs << [x, y]

    else
      possible_dirs
    end
    possible_dirs
  end

  def to_s
    if self.color == :white
      " ♟ "
    else
      " ♙ "
    end
  end

end
