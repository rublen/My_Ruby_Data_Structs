class MyStack
  def initialize 
    @val = []
  end
  
  def push (value)
    @val << value
  end
  
  def pop
    @val.pop
  end
  
  def empty?
    @val.empty?
  end
  
  def get_last
    @val.last
  end
  
  def length
    @val.length
  end
  
  def to_s
    @val.each {|el| print el, ' '}
    puts
  end
  
  def method_missing(meth, *args)  
    puts "It's a STACK! You can't use method #{meth}"
    super
  end
end


puts "\n", '* * * * *'.center(30)

my_stack = MyStack.new

puts "Emptiness: #{my_stack.empty?}", "---After pushing---"

(0..10).each {|n| my_stack.push(n)}

my_stack.to_s

puts "Emptiness: #{my_stack.empty?}"
puts "Length = #{my_stack.length}"
puts "Last el: #{my_stack.get_last}"
puts "Popped el: #{my_stack.pop}"
puts "Length = #{my_stack.length}"

my_stack.to_s
puts 
arr = [22, 33, 44]
p arr
puts "arr[1] = #{arr[1]}", '' # must be all right - 22
print "my_stack[5] = "
puts my_stack[5] # must be error
