class Pawn < Piece
  SYM = :P
  attr_accessor :pos, :name, :color
  def initialize
    @pos = [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6],
  [1,7], [6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7]]
    @name = "Pawn"
    @color = nil
  end
end
