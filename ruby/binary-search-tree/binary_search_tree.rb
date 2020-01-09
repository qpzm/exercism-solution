=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end
class Bst
  attr_accessor :data, :right, :left

  def initialize(data)
    @data = data
  end

  def insert(num)
    if num > data
      if right.nil?
        self.right = Bst.new(num)
      else
        right.insert(num)
      end
    else
      if left.nil?
        self.left = Bst.new(num)
      else
        left.insert(num)
      end
    end
  end

  def each(&block)
    return enum_for(__method__) if block.nil?

    left.each(&block) unless left.nil?
    block.call(data)
    right.each(&block) unless right.nil?
  end
end
