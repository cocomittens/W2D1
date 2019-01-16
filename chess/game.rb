require_relative "display"

class Game
  attr_reader :display
  def initialize
    @display = Display.new
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  while true

    
    game.display.render
    game.display.cursor.get_input
    p game.display.cursor.selected
    p game.display.cursor.cursor_pos
    sleep(2)

    system "clear"

  end

end 