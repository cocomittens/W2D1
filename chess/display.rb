require_relative "board"
require_relative "cursor"
require "colorize"


class Display
  attr_reader :cursor, :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([1,1], @board)
  end

  def render
    arr = [" " + ("A".."H").to_a.join("")]
    @board.rows.each_with_index do |r,i|
      arr << (i+1).to_s + r.map {|space| space.to_s }.join
    end
    #update cursor position with color
    r,c = @cursor.cursor_pos
    if cursor.selected
      arr[r][c] = arr[r][c].colorize(:background => :blue) 
    else
      arr[r][c] = arr[r][c].colorize(:background => :red)
    end
   
    puts arr
  end
end

def test
  display = Display.new
  while true
    system "clear"
    display.render
    display.cursor.get_input

  end
end

# board = Board.new
# display=Display.new(board)
# display.render
# board.move_piece([0,0], [4,1])
# display.render
# test
