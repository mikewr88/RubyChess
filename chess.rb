require_relative 'board'
require_relative "null_piece"
require_relative "player"

class Chess
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def play
    until false
      loop do
        start_pos = @player.move_turn
        put_pos = @player.move_turn
        next if @board[start_pos].class == NullPiece
        next if start_pos == put_pos || !@board[start_pos].valid_moves.include?(put_pos)
        next if @board[start_pos].color != @player.color
        @board.move_piece(start_pos, put_pos)
        @player.switch_color
      end
    end
  end
end

c = Chess.new
c.play
