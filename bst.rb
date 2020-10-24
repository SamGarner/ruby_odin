# frozen_string_literal: false

# node class
class Node
  include Comparable
  # attr_reader :value
  attr_accessor :left_child, :right_child, :value

  def <=>(other)
    value <=> other.value
  end

  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end
end

# tree class
class Tree
  attr_reader :sorted_array, :mid, :tree_array
  attr_accessor :root, :node

  def initialize(array)
    tree_array = array.uniq.sort
    @root = build_tree(tree_array)
  end

  def build_tree(tree_array, first_index = 0, last_index = tree_array.length - 1)
    return nil if first_index > last_index

    mid = (first_index + last_index)/2.floor
    # @last_index = last_index
    root = Node.new(tree_array[mid])

    root.left_child = build_tree(tree_array, 0, mid - 1)
    root.right_child = build_tree(tree_array, mid + 1, last_index)

    return root
  end

troubleshooting: Tree.new([3, 1, 2])

build_tree([1, 2, 3], 0, 2)
mid = 1
root = Node (value = 2)
root.left_child = build_tree([1, 2, 3], 0, 0)
  mid = 0
  root = Node (value = 1)
  root.left_child = build_tree([1, 2, 3], 0, -1)
    nil
  root.right_child = build_tree([1, 2, 3], 1, 0) ## is last index pulling in right?
    nil
root.right_child = build_tree([1, 2, 3], 2, 2)
  mid = 2
  root = Node (value = 3)
  root.left_child = build_tree([1, 2, 3], 0, 1)
    mid = 0
    root = 1 # INCORRECT!
    root.left_child = build_tree([1, 2, 3], 0, -1)
      nil
    root.right_child = build_tree([1, 2, 3], 1, 2)
      mid = 1
      root = 2 # INCORRECT
      root.left_child = build_tree([1, 2, 3], 0, 0)
      root.right_child = build_tree([1, 2, 3], 2, 2)
  root.right_child = build_tree([1, 2, 3], 3, 2)
    nil


  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end

p test_tree = Tree.new([3, 1, 2])
test_tree.pretty_print

#   def build_tree(array, first_index = 0, last_index = array.length - 1)
#     # NEED STOPPING POINT FOR RECURSION
#     return nil if first_index > last_index
    
#     @sorted_array = array.uniq.sort # is this getting reassigned ? 
#     len = sorted_array.length
#     mid = (len / 2).floor
#     # first_index = 0
#     # last_index = len - 1
#     root = Node.new(sorted_array[mid])
#     # self.root.value = sorted_array[mid]
#     root.left_child = build_tree(sorted_array[0..mid-1], 0, mid-1)
#     root.right_child = build_tree(sorted_array[mid+1..len-1], mid, len - 1)
#     return root
#   end
# end

# /example walkthrough
#   build_tree([3,1,2])
#   sorted_array = [1,2,3]
#   len = 3
#   mid = 1 index
#   root => [Node]value = 2
#   root.left_child = build_tree([1], 0, 0)
#     sorted_array = [1]
#     len = 1
#     mid = 0
#     root => [Node]value =1
      # root.left_child = build_tree([1],0,-1)
      #   return nil
# root.left_child = build_tree(***array notation [0..-1] is off here and will return array when dont want one ***) 
#   root.right_child = build_tree([3]) 

#   def build_tree(array)
#     # NEED STOPPING POINT FOR RECURSION
#     @sorted_array = array.uniq.sort
#     len = sorted_array.length
#     mid = (len / 2).floor
#     first_index = 0
#     last_index = len - 1
#     root = Node.new(sorted_array[mid])
#     # self.root.value = sorted_array[mid]
#     return nil if first_index > last_index
#     root.left_child = build_tree(sorted_array[0..mid-1])
#     root.right_child = build_tree(sorted_array[mid+1..len-1])
#     return root
#   end

# /example walkthrough
#   build_tree([3,1,2])
#   sorted_array = [1,2,3]
#   len = 3
#   mid = 1
#   first_index = 0
#   last_index = 2
#   root => [Node]value = 2
#   root.left_child = build_tree([1])
#     sorted_array = [1]
#     len = 1
#     mid = 0
#     first_index = 0
#     last_index = 0
#     root => [Node]value =1
#     root.left_child = build_tree(***array notation [0..-1] is off here and will return array when dont want one ***) 
#   root.right_child = build_tree([3]) 

#   # def build_tree(array)
#   #   # NEED STOPPING POINT FOR RECURSION
#   #   @sorted_array = array.uniq.sort
#   #   len = sorted_array.length
#   #   mid = (len / 2).floor
#   #   root = Node.new(sorted_array[mid])
#   #   # self.root.value = sorted_array[mid]
#   #   return root if len == 1
#   #   root.left_child = build_tree(sorted_array[0..mid-1])
#   #   root.right_child = build_tree(sorted_array[mid..len-1])
#   #   return root
#   # end
# end

