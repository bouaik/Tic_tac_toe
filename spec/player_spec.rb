# frozen_string_literal: true
require_relative '../lib/game_logic.rb'

describe Player do
  let(:player) { Player.new('Johny_Test', 'x', board) }
  let(:mark) { player.mark }
  let(:board) { Board.new }

  describe '#initialize' do
    it 'creates a player with a chosen name' do
      expect(player.name).to eq('Johny_Test')
    end

    it 'creates a player with a chosen mark' do
      expect(player.mark).to eq('x')
    end

    it 'raises an error when wrong number of arguments is given' do
      expect { Player.new }.to raise_error(ArgumentError)
    end

    it 'raises an error when no name is chosen' do
      expect { Player.new('x', @board) }.to raise_error(ArgumentError)
    end
  end

  describe '#choose_spot' do
    it 'asks the player for input' do
      allow($stdin).to receive(:gets).and_return(5)
      player_input = $stdin.gets
      expect(player_input).to eq(5)
    end
  end

  describe '#valid?' do
    it 'checks if the user has given a valid input' do
      expect(player.valid?(5)).to be true
    end
    it 'evaluates to false when an invalid input is chosen' do
      expect(player.valid?(100)).to be false
    end
  end

  describe '#input_mark' do
    it 'raises an error when given an argument' do
      expect { player.input_mark(5) }.to raise_error(ArgumentError)
    end
  end
end
