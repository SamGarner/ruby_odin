# frozen_string_literal: false

# node class
class Node
  include Comparable
  attr_reader :value

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

  def initialize(array)
    @tree_array = array
    @root = nil
  end

end
