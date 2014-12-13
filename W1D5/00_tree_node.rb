class PolyTreeNode

  attr_accessor :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(in_parent)

    parent.children.delete(self) if parent

    unless self == in_parent
      @parent = in_parent
      in_parent.children << self unless in_parent.nil?
    end
  end

  def add_child(child_node)
    #set child's @parent to self
    #add child to our array of children
    child_node.parent = self
  end

  def remove_child(child)
    # nil the child's parent
    # remove child from our array of children
    raise "Error" unless children.include?(child)
    child.parent = nil
  end

  def dfs(target_value)

    return self if value == target_value

    children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end

    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue += node.children
    end
  end

  def trace_path_back
    result = [self.value]
    current_parent = parent
    while current_parent
      result << current_parent.value
      current_parent = current_parent.parent
    end
    result
  end

end

# node1 = PolyTreeNode.new("root")
# node2 = PolyTreeNode.new("child1")
# node3 = PolyTreeNode.new("child2")
# node4 = PolyTreeNode.new("grandhild1")
#
# node2.parent = node1
# node3.parent = node1
# node4.parent = node2
#
# p node4.trace_path_back
