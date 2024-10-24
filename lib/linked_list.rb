# Linked List => one node linkes to the next node
# create linked list class where you have a head node and can add nodes to the list
class Node # New Node class
  attr_accessor :value, :next_node, :code
  def initialize(code, value)
    @next_node = nil
    @value = value
    @code = code
  end
end

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(hashed_code, value) # add node to existing list
    new_node = Node.new(hashed_code, value)
    if @head.nil?
      @head = new_node
    else
      current_node = new_node
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node = new_node
    end
  end
end

list = LinkedList.new
list.append('yellow', 'banana')
list.append('yellow', 'banana')