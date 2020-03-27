require_relative '../lib/game_logic.rb'
require_relative '../lib/board.rb'
# The InputOutput helper module utilising print/puts/gets
module InputOutput
  def self.win_message(player)
    puts
    p "Congratulations #{player.name}, you won!"
  end

  def self.draw_message
    puts
    p 'An equal match.'
  end

  def self.choose_spot(_player)
    STDIN.gets.chomp.to_i
  end

  def self.input_error
    puts
    p 'Wrong format or occupied spot. Please choose a spot from 1 to 9'
  end

  def self.render_board(board)
    puts
    p " #{board.field[1]} | #{board.field[2]} | #{board.field[3]} "
    p '-----------'
    p " #{board.field[4]} | #{board.field[5]} | #{board.field[6]} "
    p '-----------'
    p " #{board.field[7]} | #{board.field[8]} | #{board.field[9]} "
    puts
  end

  def self.your_turn(player, game_logic)
    puts "#{player.name} #{game_logic.make_a_move.sample}"
    puts
  end
end
