require_relative 'board'
require_relative "null_piece"
require_relative "player"

class Chess
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  # def play
  #   until false
  #     loop do
  #       start_pos = @player.move_turn
  #       put_pos = @player.move_turn
  #       next if @board[start_pos].class == NullPiece
  #       next if start_pos == put_pos || !@board[start_pos].valid_moves.include?(put_pos)
  #       next if @board[start_pos].color != @player.color
  #       @board.move_piece(start_pos, put_pos)
  #       @player.switch_color
  #     end
  #   end
  # end

  def notify_players
    if board.in_check?(@player.color)
      puts "#{@player.color} is in Check"
    end
  end

  def play
    until @board.checkmate?(@player.color)

        start_pos = @player.move_turn
        put_pos = @player.move_turn
        next if @board[start_pos].class == NullPiece
        next if start_pos == put_pos || !@board[start_pos].valid_moves.include?(put_pos)
        next if @board[start_pos].color != @player.color
        @board.move_piece(start_pos, put_pos)
        @player.switch_color

    end
    # @player.display.render
    puts "#{@player.color} is checkmated"
    nil
  end
end

c = Chess.new
c.play
