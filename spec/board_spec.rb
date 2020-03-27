require_relative '../lib/game_logic.rb'

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'creates an instance of a board' do
      expect(board.nil?).to eq(false)
    end
  end

  describe '#add_mark' do
    it 'adds the mark of the current player at a chosen spot' do
      expect(board.add_mark(5, 'x')).to eq('x')
    end
    it 'raises an error when wrong number of arguments is given' do
      expect { board.add_mark }.to raise_error(ArgumentError)
    end
  end

  describe '#win_line?' do
    it 'checks for winning lines' do
      board.field[1] = 'x'
      board.field[2] = 'x'
      board.field[3] = 'x'
      expect(board.win_line?('x')).to eq(true)
    end
  end

  describe '#horizontals' do
    it 'returns an array of the horizontal lines of the board' do
      expect(board.horizontals).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  describe '#verticals' do
    it 'returns an array of the verticals lines of the board' do
      expect(board.verticals).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    end
  end

  describe '#diagonals' do
    it 'returns an array of the diagonals lines of the board' do
      expect(board.diagonals).to eq([[1, 5, 9], [3, 5, 7]])
    end
  end
end
