module SlidingPiece

  

end

module SteppingPiece
  def self.valid_moves(start_pos, move_diffs)
    shift = move_diffs.permutation(2).to_a.reject { |x,y| x.abs == y.abs }
    shift.map do |offset|
      x, y = start_pos
      dx, dy = offset
      [x+dx, y+dy]
    end
  end
  

end

class Piece
  def initialize
  end

  def to_s
    "P"
  end

  def inspect
    "#<#{self.class}:#{self.objectid}>"
  end

end
require "byebug"
class Knight < Piece
  include SteppingPiece
  attr_reader :moves
  def initialize
    @moves = SteppingPiece.valid_moves([1,1],[-3, -1, 1, 3])
  end
  
end

class King < Piece
  include SteppingPiece
  attr_reader :moves
  def initialize
    @moves = SteppingPiece.valid_moves([1,1],[-1, 0, 1])
  end
  
end

knight = Knight.new
king = King.new
p knight.moves
p king.moves