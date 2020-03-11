#!/usr/bin/env ruby
class Game
  def initialize
    puts 'Enter the name of the first player : '
    player1 = gets.chomp

    puts 'Enter the name of the second player : '
    player2 = gets.chomp
    puts
    @player1 = Player.new(player1, 'X')
    @player2 = Player.new(player2, 'O')
    @players = [@player1, @player2]
    @player = @players.sample
    @game_over = false
    @board = ['', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    @win = %w[123 456 789 147 258 369 159 357]
    @turn_count = 0
  end

  def show_board
    puts
    puts "#{@board[1]} | #{@board[2]} | #{@board[3]}"
    puts '---------'
    puts "#{@board[4]} | #{@board[5]} | #{@board[6]}"
    puts '---------'
    puts "#{@board[7]} | #{@board[8]} | #{@board[9]}"
    puts
  end

  def turn(player)
    puts "#{player.name} chose a spot from 1 to 9 :"
    spot = gets.chomp
    if @board.join('').include? spot
      @turn_count += 1
      @board[spot.to_i] = player.mark
      player.player_spots += spot
      check_win(player.player_spots, player.name)
      if @turn_count == 9 && !@game_over
        show_board
        puts 'DRAWW!!!'
      elsif !@game_over
        show_board
        swap(player)
      end
    else
      puts "Spot taken or doesn't exist, Try again"
      turn(player)
    end
  end

  def swap(player)
    player == @player1 ? turn(@player2) : turn(@player1)
  end

  def start_game
    show_board
    turn(@player)
  end

  def check_win(player_spots, name)
    check = 0
    @win.each do |win_win|
      player_spots.scan(/./) do |n|
        check += 1 if win_win.include? n
      end
      if check == 3
        puts "#{name} YOU WIN!!!!!!"
        show_board
        @game_over = true
      end
      check = 0
    end
  end
end

class Player
  attr_accessor :player_spots, :name, :mark
  def initialize(name, mark)
    @name = name
    @mark = mark
    puts "#{@name} You mark is #{mark}"
    @player_spots = ''
  end
end

game = Game.new

game.start_game
