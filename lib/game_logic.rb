require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative './input_output_module'
# The Game class
class Gamelogic
  attr_reader :make_a_move

  def initialize(game)
    @game = game
    @make_a_move = ['make a move!',
                    'get down!',
                    'your turn.',
                    'wait a minute... Are you X or O?',
                    'choose a spot!']
  end

  def game_over(player, board)
    win(player, board) || draw(board)
  end

  def win(player, board)
    (InputOutput.win_message(player) if board.win_line?(player.mark)) || false
  end

  def draw(board)
    (InputOutput.draw_message if board.field.none?(Integer)) || false
  end

  def swap(current_player, player1, player2)
    @game.current_player = current_player == player1 ? player2 : player1
  end
end
