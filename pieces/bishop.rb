class Bishop < Piece
  SYM = :B
  attr_accessor :pos, :name, :color
  def initialize
    @pos = [[0,2], [0,5], [7,2], [7,5]]
    @name = "Bishop"
    @color = nil
  end

  def move_dirs
  end
end
