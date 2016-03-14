class Rook < Piece
  SYM = :R
  attr_accessor :pos, :name , :color
  def initialize
    @pos = [[0,0], [0,7], [7,0], [7,7]]
    @name = "Rook"
    @color = nil
  end

  def move_dirs
  end
end
