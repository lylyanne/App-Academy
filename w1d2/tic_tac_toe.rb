class Board
  attr_reader :grids

  def self.grids
    Array.new(3) { Array.new(3, " ") }
  end

  def initialize(grids = Board.grids)
    @grids = grids
  end

  def [](pos)
    grids[pos]
  end

  def render
    grids.each do |row|
       p row
    end
  end

  def row_winner?
    grids.each do |row|
      return true if row == ["X","X","X"] || row == ["O","O","O"]
    end
    false
  end

  def column_winner?
    grids.transpose.each do |col|
      return true if col == ["X","X","X"] || col == ["O","O","O"]
    end
    false
  end

  def diag_winner?
    diag_arr1 = [grids[0][0], grids[1][1], grids[2][2]]
    diag_arr2 = [grids[0][2], grids[1][1], grids[2][0]]
    return true if diag_arr1 == ["X","X","X"] || diag_arr1 == ["O","O","O"]
    return true if diag_arr2 == ["X","X","X"] || diag_arr2 == ["O","O","O"]
    false
    end

  def won?
    row_winner? || column_winner? || diag_winner?
  end

  def draw? #does this work?
    grids.each do |row|
      return false if row.any? { |el| el == " " }
    end
    true
  end

  def all_empty_pos
    result = []
    (0..2).each do |i|
      (0..2).each do |j|
        result << [i, j] if grids[i][j] == " "
      end
    end
    result
  end

end


class Game
  attr_reader :turn
  attr_accessor :board

  def initialize
    @board = Board.new
    @turn = ["O", "X"]
  end

  def play
    until board.won? || board.draw?
      board.render
      puts "Where do you want to play a move (row)?"
      row = gets.chomp.to_i
      puts "Where do you want to play a move (column)?"
      col = gets.chomp.to_i
      if board[row][col] == " "
        board[row][col] = turn[0]
        turn.rotate!
      else
        puts "Spot already taken, you must be tired. Try again!"
      end
      comp_play
    end

    board.render
    puts "Winner!" if board.won?
    puts "Draw!" if board.draw?

  end

  def comp_play
    potential_play = board.all_empty_pos
    x, y = potential_play.sample
    board[x][y] = turn[0]
    turn.rotate!
  end

end

# class HumanPlayer
#   def initialize(name)
#     @name = name
#   end
#
#   def move
#     gets.chomp
#   end
# end
#
# class ComputerPlayer
#   def initialize(name = "computer")
#     @name = name
#   end
#
#   def move
#     #fancy calc
#   end
# end

new_game = Game.new
new_game.play
