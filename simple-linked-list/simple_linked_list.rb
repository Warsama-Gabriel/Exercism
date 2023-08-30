class Element
  attr_reader :datum
  attr_accessor :next
  
  def initialize(value)
    @datum = value
    @next = nil
  end
end

class SimpleLinkedList
  def initialize
    @head = nil
  end

  def push(element)
    element.next = @head
    @head = element
    self
  end


end