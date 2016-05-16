require_relative 'stepping'


class Knight < Piece
  include Stepping

  # def initialize(board, pos, color)
  #   super
  # end

  def to_s
    if self.color == :white
      " ♘ "
    else
      " ♞ "
    end
  end

  def move_dirs
    Stepping::KNIGHT_MOVES
  end
end
