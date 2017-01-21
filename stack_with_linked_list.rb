class Node
  attr_accessor :value
  attr_reader :next
  def initialize (value, nekst = nil)
    @value, @next = value, nekst
  end
end

class List
  attr_reader :head
  @@counter = 0
  
  def initialize(value = nil)
    @head = Node.new(value)
    @@counter = 1 if value != nil
  end
  
  def empty?
    @head.value == nil
  end
  
  def add (value)
    @head = Node.new(value, @head)
    @@counter += 1
  end
  
  def length
    @@counter
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
  
  def pop
    popped = @head.value
    @head = @head.next
    @@counter -= 1
    return popped
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
  
  alias_method :push, :add
end


def outputting(list)
  puts "empty? #{list.empty?}"
  puts "head: #{list.head.value}"
  puts "length: #{list.length}"
  puts list
  puts "--------"
end

puts "\n-----START-----"
lst0 = List.new
outputting(lst0)

lst = List.new(1)
outputting(lst)

lst.add(12)
outputting(lst)

lst.add(369)
lst.add(555)
lst.push(111)
outputting(lst)


puts "\n---After popping---"
puts "popped el.: #{lst.pop}"
outputting(lst)

def find_el(list, x)
  if list.find(x)
    puts "#{x} is element №#{list.find(x)}"
  else
    puts "There is no el. #{x} in this list"
  end
end

puts
find_el(lst, 12)
find_el(lst, 555)
find_el(lst, 7)

#The print method calls the to_s method of the object being printed. puts it's print + \n. 
puts "\n\"puts list\" with my method #to_s"
puts lst

#The p calls the inspect method upon the object being printed.
puts "\n\"p list\" with my method #inspect"
p lst