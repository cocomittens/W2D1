require_relative "board.rb"
require "byebug"
require "singleton"

module SlidingPiece
  attr_reader :moves
  

end

module SteppingPiece
  attr_reader :moves
  def valid_moves(move_diffs)
    shift = move_diffs.permutation(2).to_a.reject { |x,y| x.abs == y.abs }
    shift.map do |offset|
      x, y = self.pos
      dx, dy = offset
      [x+dx, y+dy]
    end
  end
  

end

class Piece
  attr_reader :pos, :board
  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def to_s
    "P"
  end

  def inspect
    "#<#{self.class}:#{self.objectid}>"
  end

 

end

class Knight < Piece
  include SteppingPiece

  def initialize(pos, board)
    super
    @moves = valid_moves([-3, -1, 1, 3]).select{ |move| board.valid_pos?(move) }
  
  end

  def to_s
    "N"
  end
  
end

class King < Piece
  include SteppingPiece

  def initialize(pos, board)
    super
    @moves = valid_moves([-3, -1, 1, 3]).select{ |move| board.valid_pos?(move) }
  end

  def to_s
    "K"
  end
  
end

class Rook < Piece
  include SlidingPiece

  def initialize(pos, board)
    super
  end

  def to_s
    "R"
  end
end

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board)
    super
  end
  def to_s
    "B"
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(pos, board)
    super
  end

  def to_s
    "Q"
  end
end

class Pawn < Piece
  attr_reader :moves

  def initialize(pos, board)
    super
  end

  def to_s
    "P"
  end
end

class NullPiece
  include Singleton
  def initialize
  end
  
  def to_s
    " "
  end
end