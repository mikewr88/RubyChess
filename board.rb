require 'byebug'
require_relative "display"
require_relative "null_piece"
require_relative "piece"
require_relative "pieces/rook"
require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/queen"
require_relative "pieces/knight"
require_relative "pieces/pawn"



class Board
  attr_accessor :grid, :display, :pieces

  def initialize(should_pop = true)
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }  #we need to make sure that a nullPiece is addded to where a piece used to be
    @pieces = []
    self.populate if should_pop
  end

  def move_piece!(start, end_pos)
    raise "There is no piece at this position" if start.nil? ##
    #raise "End position is not valid" ##
    while self[start].class != NullPiece

        self[start].current_pos = end_pos
        self[end_pos] = self[start]
        self[start] = NullPiece.new

    end
  end

  def move_piece(start, end_pos)
    raise "There is no piece at this position" if start.nil? ##
    #raise "End position is not valid" ##
    while self[start].class != NullPiece
      if self[start].valid_moves.include?(end_pos)
        self[start].current_pos = end_pos
        self[end_pos] = self[start]
        self[start] = NullPiece.new
      end
    end
  end

  def populate

    white_pieces = [
      Rook.new(self, [0, 0], :white),
      Rook.new(self, [0, 7], :white),
      Knight.new(self, [0, 1], :white),
      Knight.new(self, [0, 6], :white),
      Bishop.new(self, [0, 2], :white),
      Bishop.new(self, [0, 5], :white),
      King.new(self, [0, 3], :white),
      Queen.new(self, [0, 4], :white)
    ]

    (0..7).each do |i|
      pawn = Pawn.new(self, [1, i], :white)
      white_pieces << pawn
    end

    white_pieces.each do |piece|
      self[piece.current_pos] = piece
    end


    black_pieces = [
      Rook.new(self, [7, 0], :black),
      Rook.new(self, [7, 7], :black),
      Knight.new(self, [7, 1], :black),
      Knight.new(self, [7, 6], :black),
      Bishop.new(self, [7, 2], :black),
      Bishop.new(self, [7, 5], :black),
      King.new(self, [7, 3], :black),
      Queen.new(self, [7, 4], :black)
    ]

    (0..7).each do |i|
      pawn = Pawn.new(self, [6, i], :black)
      black_pieces << pawn
    end

    black_pieces.each do |piece|
      # x, y = piece.current_pos
      # @grid[x][y] = piece
      self[piece.current_pos] = piece
    end

    @pieces = black_pieces + white_pieces

  end

  def in_bounds?(pos)
    pos.all? { |i| i.between?(0, 7) }
  end

  def dup
    my_pieces = get_pieces
    new_board = Board.new(false)
    my_pieces.each do |piece|
    piece.class.new(new_board, piece.current_pos, piece.color)
      # new_board.pieces.push(newp)
    end
    new_board
  end


  def in_check?(color)
    king_pos = find_king(color).current_pos
    @pieces.any? do |piece|
      piece.color != color && piece.moves.include?(king_pos)
    end
  end

  def find_king(color)
    @pieces.find {|piece| piece.class == King && piece.color == color}
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
