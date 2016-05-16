require_relative "display"
require_relative "board"

class Player
  attr_accessor :color
  def initialize(board)
    @display = Display.new(board, self)
    @color = :white
  end

  def move_turn
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end


  def switch_color
    if self.color == :white
      self.color = :black
    else
      self.color = :white
    end
  end

end
