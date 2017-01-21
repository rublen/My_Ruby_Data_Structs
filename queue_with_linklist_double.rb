class Node
  attr_accessor :value, :prev, :next
  def initialize (value, prev = nil, nekst = nil)
    @value, @prev, @next = value, prev, nekst
  end 
end

class List
  attr_accessor :value, :head, :tail
  @@counter = 0
  def initialize(value = nil)
    @head = Node.new(value)
    @tail = @head
    @@counter += 1 if @head.value != nil
  end
  
  def empty?
    @head.value == nil
  end
  
  def add (value)
    @head = Node.new(value, nil, @head)
    @head.next.prev = @head
    @@counter += 1
  end
  
  def next
    self.next.value
  end
  
  def length
    @@counter
  end
  
  def remove_tail
    removed = @tail.value
    @tail = @tail.prev
    @tail.next = nil
    @@counter -= 1
    return removed
  end
  
  def find(val)
    node = @head
    i = 1
    while node != nil && node.value != val
      node = node.next
      i += 1
    end
    return node == nil ? node :  i
  end
  
  def to_s
    node = @head
    str = ''
    while node != nil
      str = str + "#{node.value} --> "
      node = node.next
    end
    str = str + "nil"
  end
  
  def inspect
    "Object of class #<#{self.class}>: @head = #<#{@head.class}>, #{self.to_s}"
  end
  
  def reverse
    return self if self.empty? || self.length == 1
    tmp = @head
    @head = @tail
    @tail = tmp
    current = @head
    while current != nil
      x = current.prev
      current.prev = current.next
      current.next = x
      current = current.next
    end
    self
  end
  
  alias_method :push, :add
  alias_method :shift, :remove_tail
end

def outputting(list)
  puts "empty? #{list.empty?}"
  puts "head: #{list.head.value}"
  puts "tail: #{list.tail.value}"
  puts "length: #{list.length}"
  puts list.to_s
  puts "--------"
end

puts "\n-----START-----"
lst0 = List.new
outputting(lst0)

lst = List.new(1)
(2..9).each {|n| lst.add(n ** 2)}

outputting(lst)

puts "\n---After shifting---"
puts "shifted el.: #{lst.shift}"
outputting(lst)


def find_el(list, x)
  if list.find(x)
    puts "#{x} is element №#{list.find(x)}"
  else
    puts "There is no el. #{x} in this list"
  end
end

puts
find_el(lst, 49)
find_el(lst, 16)
find_el(lst, 7)

#The print method calls the to_s method of the object being printed. puts it's print + \n. 
puts "\n\"puts list\" with my method #to_s"
puts lst

#The p calls the inspect method upon the object being printed.
puts "\n\"p list\" with my method #inspect"
p lst

puts "\n---Reversing---"
outputting(lst.reverse)