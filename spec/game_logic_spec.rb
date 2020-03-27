require_relative '../lib/game_logic.rb'
require_relative '../bin/main.rb'
describe Gamelogic do
  let(:game) { TicTacToe.new }
  let(:player) { Player.new('tester', 'x', board) }
  let(:board) { Board.new }
  let(:game_logic) { Gamelogic.new(game) }

  describe '#initialize' do
    it 'initializes a new game' do
      expect(game_logic.nil?).to eq(false)
    end
  end

  describe '#game_over' do
    it 'returns true if a player has won' do
      allow(game_logic).to receive(:win).and_return(true)
      expect(game_logic.game_over(player, board)).to eq(true)
    end
    it 'returns false when neither win nor draw are true' do
      expect(game_logic.game_over(player, board)).to eq(false)
    end
  end

  describe '#win' do
    it 'returns true and prints a message when there is a player with a winning line' do
      allow(board).to receive(:win_line?).and_return(true)
      expect(game_logic.win(player, board)).to eq('Congratulations tester, you won!')
    end
    it 'returns false when there is no winning combination' do
      expect(game_logic.win(player, board)).to eq(false)
    end
  end

  describe '#draw' do
    it 'returns true and prints a message when the game is draw' do
      board.field = %w[pie x x o o x x x o x]
      expect(game_logic.draw(board)).to eq('An equal match.')
    end
    it 'returns false if the game is not a draw' do
      expect(game_logic.draw(board)).to eq(false)
    end
  end
end
