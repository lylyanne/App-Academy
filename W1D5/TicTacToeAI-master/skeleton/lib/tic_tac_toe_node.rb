require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def self.other_mark(mark)
    mark == :x ? :o : :x
  end

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board, @next_mover_mark, @prev_move_pos = board, next_mover_mark, prev_move_pos
  end

  def losing_node?(evaluator)
    return true if (board.over? && board.winner == next_mover_mark)
    return false if (board.over? && (board.winner == evaluator || board.winner.nil?))

    # When all of player's children are losers then it is a losing node
    losing_states = 0
    if (evaluator == next_mover_mark)
      children.each do |child|
        losing_states += 1 if child.losing_node?(evaluator)
      end
      return true if losing_states == children.length
    #when it is the opponent's turn and any of the child is a losing node
    else # evaluator != next_mover_mark
      children.each do |child|
        losing_states += 1 if child.losing_node?(evaluator)
      end
      return true if losing_states > 0
    end

    false
  end

  def winning_node?(evaluator)
    return true if (board.over? && board.winner == evaluator)
    return false if (board.over? && board.winner != evaluator)

    winning_states = 0
    #my turn
    if (evaluator == next_mover_mark)
      children.each do |child|
        winning_states += 1 if child.winning_node?(evaluator)
      end
      return true if winning_states > 0
    else
      children.each do |child|
        winning_states += 1 if child.winning_node?(evaluator)
      end
      return true if winning_states == children.length
    end

    false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = Array.new(0)
    mark = (next_mover_mark == :x ? :o : :x)

    (0..2).each do |x|
      (0..2).each do |y|
        next if !board.empty?([x,y])

        new_board = board.dup
        new_board[[x,y]] = next_mover_mark
        children << TicTacToeNode.new(new_board, mark, [x,y])
      end
    end

    children
  end
end

k = TicTacToeNode.new(Board.new, :x)

#p k.children.count
