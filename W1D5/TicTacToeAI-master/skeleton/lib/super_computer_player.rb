require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    game_state = TicTacToeNode.new(game.board, mark)
    winning_moves = []
    tie_moves = []
    game_state.children.each do |child|
      winning_moves << child.prev_move_pos if child.winning_node?(mark)
      tie_moves << child.prev_move_pos if !child.losing_node?(mark)
    end
    p winning_moves
    p tie_moves
    if winning_moves.length == 0
      if tie_moves.length == 0
        raise "I lose!"
      end
      chosen_move = tie_moves[rand(0..tie_moves.length - 1)]
    else #there are winning moves
      chosen_move = winning_moves[rand(0..winning_moves.length - 1)]
    end
    p chosen_move
    chosen_move
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
