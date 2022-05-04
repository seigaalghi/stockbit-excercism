class Element
  attr_accessor :datum, :next
  def initialize(datum)
    @datum = datum
  end
end

class SimpleLinkedList
  def initialize(values=[])
    values.each{|value| push Element.new(value)}
  end
  def push(element=nil)
    element.next = @head
    @head = element
    self
  end
  def pop
    temp = @head
    @head = @head&.next
    temp
  end
  def each(&block)
    current = @head
    while current != nil
      block.call current.datum
      current = current.next
    end
  end
  def to_a
    data = []
    current = @head
    while current
      data.push current.datum
      current = current.next
    end
    data
  end
  def reverse!
    current = @head
    @head = nil
    while current != nil
      prev = current.next
      push current
      current = prev
    end
    self
  end
end