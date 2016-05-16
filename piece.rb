require 'byebug'

class Piece

  attr_accessor :current_pos, :color
  def initialize(board, pos, color)
    @board = board
    @current_pos = pos                 # [[0,0], [0,7], [7,0], [7,7]]
    @color = color
  end

  def valid_move?(current_pos, new_pos)
    if @board.in_bounds?(new_pos) &&
      (@board[new_pos].empty? ||
        @board[new_pos].color != @board[current_pos].color)
      true
    else
      false
    end
  end

  def moves
    moves = []
    move_dirs.each do |dx, dy|
      moves.concat(grow_unblocked_moves_in_dir(dx,dy))
    end
    moves
  end

  def empty?
    false
  end

  def move_into_check?(end_pos)
    test_board = @board.dup
    test_board.move_piece!(current_pos, end_pos)
    test_board.in_check?(color)
  end

  def valid_moves
    moves.reject { |move| move_into_check?(move)}
  end
end
