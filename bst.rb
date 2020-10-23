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
  attr_reader :sorted_array
  attr_accessor :root

  def initialize(array)
    @tree_array = array
    @root = Node.new(nil)
  end

  def build_tree(array)
    # NEED STOPPING POINT FOR RECURSION
    @sorted_array = array.uniq.sort
    len = sorted_array.length
    mid = (len / 2).floor
    first_index = 0
    last_index = len - 1
    root = Node.new(sorted_array[mid])
    # self.root.value = sorted_array[mid]
    return nil if first_index > last_index
    root.left_child = build_tree(sorted_array[0..mid-1])
    root.right_child = build_tree(sorted_array[mid+1..len-1])
    return root
  end

/example walkthrough
  build_tree([3,1,2])
  sorted_array = [1,2,3]
  len = 3
  mid = 1
  first_index = 0
  last_index = 2
  root => [Node]value = 2
  root.left_child = build_tree([1])
    sorted_array = [1]
    len = 1
    mid = 0
    first_index = 0
    last_index = 0
    root => [Node]value =1
    root.left_child = build_tree(***array notation [0..0] is off here***) 
  root.right_child = build_tree([3]) 

  # def build_tree(array)
  #   # NEED STOPPING POINT FOR RECURSION
  #   @sorted_array = array.uniq.sort
  #   len = sorted_array.length
  #   mid = (len / 2).floor
  #   root = Node.new(sorted_array[mid])
  #   # self.root.value = sorted_array[mid]
  #   return root if len == 1
  #   root.left_child = build_tree(sorted_array[0..mid-1])
  #   root.right_child = build_tree(sorted_array[mid..len-1])
  #   return root
  # end
end

# 1,3,2
# @sorted_array = [1,2,3]
# len = 3
# mid = 1
# self.root = 2 [Node]

# root.
