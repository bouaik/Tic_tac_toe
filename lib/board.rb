# The Board Class
class Board
  attr_accessor :field
  def initialize
    @field = ['pie = 3.14', 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def add_mark(input, mark)
    @field[input] = mark
  end

  def win_line?(mark)
    horizontals.any? { |line| line.all?(mark) } ||
      diagonals.any? { |line| line.all?(mark) } ||
      verticals.any? { |line| line.all?(mark) }
  end

  def horizontals
    [field[1, 3], field[4, 3], field[7, 3]]
  end

  def verticals
    [
      [field[1], field[4], field[7]],
      [field[2], field[5], field[8]],
      [field[3], field[6], field[9]]
    ]
  end

  def diagonals
    [
      [field[1], field[5], field[9]],
      [field[3], field[5], field[7]]
    ]
  end
end
