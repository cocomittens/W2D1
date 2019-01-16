require_relative "display"

class Game
  attr_reader :display
  def initialize
    @display = Display.new
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  while game.display.cursor.selected == false
    system "clear"
    game.display.render
    game.display.cursor.get_input
  end

  start_pos = game.display.cursor.cursor_pos
  while game.display.cursor.selected == true
    system "clear"
    game.display.render
    game.display.cursor.get_input
  end
  end_pos = game.display.cursor.cursor_pos
  game.display.board.move_piece(start_pos, end_pos)
  game.display.render
end 