require_relative "piece.rb"
class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new(8, nil)}
    [0,1,6,7].each {|i| @rows[i].map!{|spot| Piece.new}}
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end
  
  def move_piece(start_pos, end_pos)
    raise "nothing at start position" if self[start_pos].nil?
    raise "Invalid End position" unless Board.valid_pos?(end_pos)
    raise "Piece at end position" unless self[end_pos].nil? 
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def self.valid_pos?(pos)
    row, col = pos
    (0..7).include?(row) && (0..7).include?(col)
  end

  private

end

# board = Board.new
# p board.rows
# board.move_piece("black", [0,0], [3,1])
# p board.rows
# board.move_piece("black", [0,1], [0,2])

