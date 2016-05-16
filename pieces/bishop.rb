require_relative 'sliding'

class Bishop < Piece
  include Sliding
  # def initialize(board, pos, color)
  #   super
  # end

  def to_s
    if self.color == :white
      " ♗ "
    else
      " ♝ "
    end
  end
  def move_dirs
    Sliding::DIAGONAL_MOVES
  end
end
