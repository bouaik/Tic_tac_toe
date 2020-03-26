# frozen_string_literal: true
require_relative '../lib/game_logic.rb'
require_relative '../bin/main.rb'
describe Game_logic do
  let(:game) { TicTacToe.new}
  let(:player) { Player.new("tester", 'x', board)}
  let(:board) {Board.new}
  let(:game_logic) { Game_logic.new(game)}

  describe '#initialize' do
    it 'initializes a new game' do

       expect(game_logic.nil?).to eq(false)
    end
  end

  describe '#game_over' do
    it 'returns false when neither win nor draw are ture' do
      
      expect(game_logic.game_over(player, board)).to eq(false)
    end
  end

  describe '#win' do
    it 'returns false when there is no winning combination' do
      expect(game_logic.win(player, board)).to eq(false)
    end
  end

  describe '#draw' do
    it 'returns false if the game is not a draw' do
      expect(game_logic.draw(board)).to eq(false)
    end
  end

  describe '#swap' do
    it 'swaps the current player' do
     
    end
  end
end
