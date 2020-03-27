#!/usr/bin/env ruby
require_relative '../lib/game_logic.rb'

class TicTacToe
  attr_accessor :current_player

  def initialize
    @game_logic = Gamelogic.new(self)
    @board = Board.new
    puts 'Player 1 enter your name'
    @player1 = Player.new(STDIN.gets.chomp, 'x', @board)
    puts 'Player 2 enter your name'
    @player2 = Player.new(STDIN.gets.chomp, 'o', @board)
    @players = [@player1, @player2]
    @current_player = @players.sample
    puts 'On your turn, choose a free spot on the board with numbers 1-9'
  end

  def play
    loop do
      InputOutput.render_board(@board)
      InputOutput.your_turn(@current_player, @game_logic)
      @current_player.input_mark
      break if @game_logic.game_over(@current_player, @board)
      @game_logic.swap(@current_player, @player1, @player2)
    end
  end
end
