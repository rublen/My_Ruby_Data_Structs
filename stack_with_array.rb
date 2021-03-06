# Realization stack structure with array
class MyStack
  def initialize
    @val = []
  end

  def push(value)
    @val << value
  end

  def pop
    @val.pop
  end

  def empty?
    @val.empty?
  end

  def getlast
    @val.last
  end

  def length
    @val.length
  end

  def to_s
    @val.join(' ')
  end

  def method_missing(meth, *args)
    puts "It's a STACK! You can't use method #{meth}"
    super
  end

  def respond_to_missing?(meth)
    meth
  end
end

puts '\n', '* * * * *'.center(30)

my_stack = MyStack.new

puts "Emptiness: #{my_stack.empty?}", '---After pushing---'

(0..10).each { |n| my_stack.push(n) }

puts my_stack.to_s # why don't working just 'puts my_stack'?

puts "Emptiness: #{my_stack.empty?}"
puts "Length = #{my_stack.length}"
puts "Last el: #{my_stack.getlast}"
puts "Popped el: #{my_stack.pop}"
puts "Length = #{my_stack.length}"

my_stack.to_s
puts
arr = [22, 33, 44]
p arr
puts "arr[1] = #{arr[1]}", '' # must be all right - 33
print 'my_stack[5] = '
puts my_stack[5] # must be error
