require_relative 'sliding'

class Queen < Piece
  include Sliding
  # def initialize(board, pos, color)
  #   super
  # end
  #
  def to_s
    if self.color == :white
      " ♛ "
    else
      " ♕ "
    end
  end

  def move_dirs
    Sliding::LINEAR_MOVES + Sliding::DIAGONAL_MOVES
  end
end
