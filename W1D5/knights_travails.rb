require "./00_tree_node.rb"

class KnightPathFinder

  attr_accessor :visited_positions, :root_node

  def initialize(start_pos)
    @visited_positions = [start_pos]
    @root_node = PolyTreeNode.new(visited_positions[0])
    build_move_tree
  end

  def self.valid_moves(pos)
    deltas = [[-1, -2], [-2, -1], [-1, 2], [1, -2],
              [1, 2], [2, 1], [-2, 1], [2, -1]]

    possible_values = deltas.map do |delta|
      [delta.first + pos.first, delta.last + pos.last]
    end

    possible_values.select { |x , y| x >= 0 && x < 8 && y >= 0 && y < 8 }

  end

  def new_move_positions(pos)
    new_pos = []
    self.class.valid_moves(pos).each do |pos|
      new_pos << pos unless @visited_positions.include?(pos)
    end
    self.visited_positions.concat(new_pos)

    new_pos
  end

  def build_move_tree
    queue = [root_node]
    until queue.empty?
      cur_node = queue.shift
      new_pos = new_move_positions(cur_node.value)
      new_pos.each do |new_pos|
        child = PolyTreeNode.new(new_pos)
        child.parent = cur_node
        queue << child
      end
    end
  end

  def find_path(end_pos)
    target_node = root_node.bfs(end_pos)
    target_node.trace_path_back.reverse
  end

end

k = KnightPathFinder.new([0,0])
p k.find_path([6, 2])
