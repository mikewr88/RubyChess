require "colorize"
require_relative "cursorable"

class Display
  include Cursorable

  def initialize(board, player)
    @board = board
    @cursor_pos = [0, 0]
    @player = player
    @notifications = {}
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :black
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

  def set_check!
    @notifications[:check] = "Check!"
  end

  def render
    system ("clear")
    puts "Welcome to Chess"
    puts "It is #{@player.color}'s turn"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
    @notifications.each do |key, val|
      puts "#{val}"
    end
    nil
  end
end
