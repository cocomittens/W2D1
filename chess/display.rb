require_relative "board"
require_relative "cursor"
require "colorize"


class Display
  attr_reader :cursor

  def initialize(board)
    @cursor = Cursor.new([1,1], board)
    @board = board
  end

  def render
    arr = [" 01234567"]
    @board.rows.each_with_index do |r,i|
      arr << (i.to_s + r.map {|space| space.nil? ? " " : "P" }.join)
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
  board = Board.new
  display = Display.new(board)
  while true
    system "clear"
    display.render
    display.cursor.get_input

  end
end


test
