# Realization queue structure with array
class MyQueue
  def initialize
    @val = []
  end

  def to_s
    @val.join(' ')
  end

  def method_missing(meth, *args)
    if [:push, :shift, :empty?, :length, :first].include?(meth)
      @val.send(meth, *args)
    else
      puts "It's a STACK! You can't use method #{meth}"
      super
    end
  end

  def respond_to_missing?(*)
    true
  end
end

# How it works
=begin
puts "\n", '* * * * *'.center(16)
my_q = MyQueue.new
puts "Emptiness: #{my_q.empty?}", "---After pushing---"

(1..10).each { |n| my_q.push(n) }

puts my_q.to_s

puts "Emptiness: #{my_q.empty?}"
puts "Length = #{my_q.length}"
puts "First el: #{my_q.first}"
puts "Shifted el: #{my_q.shift}"
puts "Length = #{my_q.length}"

puts
arr = [22, 33]
p arr
puts "arr[0] = #{arr[0]}", '' # must be all right - 22
print "my_q[0] = "
puts my_q[0] # must be error
=end
