class King < Piece
  SYM = :K
  attr_accessor :pos, :name, :color
  def initialize
    @pos = [[0,3], [7,3]]
    @name = "King"
    @color = nil
  end
end
