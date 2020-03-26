require_relative '../lib/game_logic.rb'
require_relative '../bin/main.rb'
describe InputOutput do
  let(:player) { Player.new('tester', 'x', board) }
  let(:board) { Board.new }
  let(:game) { TicTacToe.new }
  let(:game_logic) { Game_logic.new(game) }
  
  describe '#win_message' do
    it 'prints a message if there is a win' do
      expect(InputOutput.win_message(player)).to eq("Congratulations tester, you won!")
    end
  end

  describe '#draw_message' do
    it 'prints a message if the game is draw' do
      expect(InputOutput.draw_message).to eq("An equal match.")  
    end 
  end

  describe '#choose_spot' do
    it 'returns 0 if no input' do
      allow($stdin).to receive(:gets).and_return(5)
      input = $stdin.gets

      expect(input).to eq(5)
    end
  end

  describe '#input_error' do
    it 'prints an error message when invalid spot is chosen' do
      expect(InputOutput.input_error).to eq("Wrong format or occupied spot. Please choose a spot from 1 to 9")
    end
  end

  describe '#render_board' do
    it 'prints the board to the console' do
      expect(InputOutput.render_board(board)).to eq(p)
    end
  end

  describe '#your_turn' do
    it 'prints a message to tell the player that he should make a move' do
      expect(InputOutput.your_turn(player, game_logic)).to eq(p)
    end
  end
end