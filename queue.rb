class MyQueue
  def initialize 
    @val = []
  end
  
  def push (value)
    @val << value
  end
  
  def shift
    @val.shift
  end
  
  def empty?
    @val.empty?
  end
  
  def get_first
    @val.first
  end
  
  def length
    @val.length
  end
  
  def to_s
    @val.each {|el| print el, ' '}
    puts
  end
  
  def method_missing(meth, *args)  
      puts "It's a QEUE! You can't use method #{meth}"
    super
  end
end

puts "\n", '* * * * *'.center(16)
my_q = MyQueue.new
puts "Emptiness: #{my_q.empty?}", "---After pushing---"

(1..10).each {|n| my_q.push(n)}

my_q.to_s

puts "Emptiness: #{my_q.empty?}"
puts "Length = #{my_q.length}"
puts "First el: #{my_q.get_first}"
puts "Shifted el: #{my_q.shift}"
puts "Length = #{my_q.length}"

my_q.to_s
puts 
arr = [22, 33]
p arr
puts "arr[0] = #{arr[0]}", '' # must be all right - 22
print "my_q[0] = "
puts my_q[0] # must be error