require_relative "board"
require "colorize"

class Display

  def initialize(board)
    @board = board
  end

  def render
    puts " 01234567"
    @board.rows.each_with_index do |r,i|
      r.map
      puts (i.to_s + r.map {|space| space.nil? ? " " : "P" }.join)
    end

  end
end

board = Board.new

display = Display.new(board)
display.render