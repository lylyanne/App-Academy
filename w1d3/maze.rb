class Maze
  attr_accessor :maze
  def initialize(fname)
    @maze = File.readlines(fname).map(&:chomp).map do |line|
      line.split('')
    end
  end

  def display
    maze.each do |row|
      puts row.join(" ")
    end
    nil
  end

  def get_neighbors(coord)
    deltas = [[-1, 0],
              [1,  0],
              [0, -1],
              [0,  1]]
    deltas.map do |delta|
      [coord.first + delta.first, coord.last + delta.last]
    end
  end

  def get_valid_neighbors(coord, visited)
    neighbors = get_neighbors(coord)
    unvisited = neighbors - visited
    unvisited.reject { |(r,c)| maze[r][c] == "*" }
  end

  def is_goal?(coord)
    r, c = coord
    maze[r][c] == "E"
  end

  def start
    maze.each_with_index do |row, i|
      row.each_with_index do |el, j|
        return [i,j] if maze[i][j] == "S"
      end
    end
  end

  def bfs
    visited = []
    queue = [[start, []]]
    while !queue.empty?
      here, path = queue.shift
      if is_goal? here
        return path
      end
      visited << here
      neighbors = get_valid_neighbors(here, visited)
      neighbors.each do |n|
        queue.push([n, path + [here]])
      end
    end
    puts "No exit found!"
  end
end

m = Maze.new("maze.txt")

# p m.get_valid_neighbors([1,1],[[1,2],[2,1]])
p m.bfs

m.display
