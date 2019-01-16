require_relative "piece.rb"

class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new(8, nil)}
    create_board
  end

  def create_board
    rooks = [[0,0], [0,7], [7,0], [7,7]]
    knights =[[0,1], [0,6], [7,1], [7,6]]
    bishops = [[0,2], [0,5], [7,2], [7,5]]
    queens = [[0,3], [7,3]]
    kings = [[0,4], [7,4]]

    rooks.each {|pos| self[pos] = Rook.new(pos, self)}
    knights.each {|pos| self[pos] = Knight.new(pos, self)}
    bishops.each {|pos| self[pos] = Bishop.new(pos, self)}
    queens.each {|pos| self[pos] = Queen.new(pos, self)}
    kings.each {|pos| self[pos] = King.new(pos, self)}

    [1,6].each { |row| @rows[row].map! { |item| Pawn.new([1, row], self) } }
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
    raise "Invalid End position" unless self.valid_pos?(end_pos)
    raise "Piece at end position" unless self[end_pos].nil? 
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def valid_pos?(pos)
    row, col = pos
    (0..7).include?(row) && (0..7).include?(col)
  end

  private

end




