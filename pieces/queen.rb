class Queen < Piece
  SYM = :Q
  attr_accessor :pos, :name, :color
  def initialize
    @pos = [[0,4],[7,4]]
    @name = "Queen"
    @color = nil
  end

  def move_dirs
  end
end
