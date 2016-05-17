require_relative 'stepping'

class King < Piece
  include Stepping

  # def initialize(board, pos, color)
  #   super
  # end

  def to_s
    if self.color == :white
      " ♚ "
    else
      " ♔ "
    end
  end

  def move_dirs
    Stepping::KING_MOVES
  end
end
