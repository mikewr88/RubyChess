class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def move(start, end_pos)
    raise "There is no piece at this position" if start.nil? ##
    raise "End position is not valid" ##

  end

  def populate
    @grid
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

end
