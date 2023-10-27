class Node
  attr_accessor :value, :next_node
  
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
  
end

class LinkedList
  attr_reader :head, :tail
  
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    @head ||= new_node
    unless @tail
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end 

  def size
    count = 0
    current_node = @head
    until current_node.nil?
      count+=1
      current_node = current_node.next_node
    end
    count
  end

  def at(index)
    array_node = []
    current_node = @head
    until current_node.nil?
      array_node << current_node
      current_node = current_node.next_node
    end

    if (0..array_node.size-1).cover?(index)
      p array_node[index]
    else
      puts "Index errado, passe uma valor entre 0 à #{array_node.size - 1}"
    end
  end

  def pop
    @tail.value = nil
    end_node = self.at(self.size - 2)
    @tail = end_node
    end_node.next_node = nil
  end

  def contains?(value)
    current_node = @head
    while current_node
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    return false
  end

  def find(value)
    index = 0
    current_node = @head
    while current_node
      return index if current_node.value == value
      index+=1
      current_node = current_node.next_node
    end
    return false
  end

  def to_s
    phrase = ""
    current_node = @head
    while current_node
      phrase+="(#{current_node.value})->"
      current_node = current_node.next_node
    end
    phrase+="nil"
    puts phrase
  end

end

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)
list.append(6)
list.append(7)

list.pop
list.to_s