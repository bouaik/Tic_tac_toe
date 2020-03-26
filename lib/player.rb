require_relative './input_output_module'
# The Player class
class Player
  attr_accessor :name
  attr_reader :mark

  def initialize(name, mark, board)
    @name = name
    @mark = mark
    @board = board
  end

  def choose_spot
    InputOutput.choose_spot(@current_player)
  end

  def valid?(input)
    @board.field.include?(input)
  end

  def input_mark
    loop do
      input = choose_spot
      if valid?(input)
        @board.add_mark(input, mark)
        break
      else
        InputOutput.input_error
      end
    end
  end
end
