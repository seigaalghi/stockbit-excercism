class Bst
  attr_reader :data, :left, :right
  def initialize(data = nil)
    @data = data
  end
  def insert(data)
    @data = data if @data.nil?
    @right ? @right.insert(data) : @right = Bst.new(data) if data > @data
    @left ? @left.insert(data) : @left = Bst.new(data) if data <= @data
  end

  def each(&block)
    return to_enum(:each) unless block_given?
    @left.each(&block) if @left
    block.call @data
    @right.each(&block) if @right
  end
end