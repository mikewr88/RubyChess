class Knight < Piece
  SYM = :N
  attr_accessor :pos, :name, :color
  def initialize
    @pos = [[0,1], [0,6], [7,1], [7,6]]
    @name = "Knight"
    @color = nil
  end
end
