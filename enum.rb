class ChineseZodiac
   def self.add(key, value)
     @hash ||= {}
     @hash[key] = value
   end
   
   self.add(:MONKEY, 0)
   self.add(:ROOSTER, 1)
   self.add(:DOG, 2)
   self.add(:PIG, 3)
   self.add(:RAT, 4)
   self.add(:OX, 5)
   self.add(:TIGER, 6)
   self.add(:RABBIT, 7)
   self.add(:DRAGON, 8)
   self.add(:SNAKE, 9)
   self.add(:HORSE, 10)
   self.add(:GOAT, 11)
   
   def self.const_missing(const)
     #puts const.is_a? String #=> false
     #puts const.is_a? Symbol #=> true
     @hash[const]
   end
   
   def self.to_s(val)
     if (0..11).include?(val)
       @hash.keys.find {|key| @hash[key] == val}.to_s
     else return
     end
   end
   
   def self.each
      @hash.each {|key, value| yield(key, value)}
   end
end

puts "___Chinese_Zodiac___".center(30)

print "There are twelve totem animals in Chinese Zodiac: "
ChineseZodiac.each {|k, v| print "#{k} "}


puts "\n  - Value of ChineseZodiac::DOG is #{ChineseZodiac::DOG}"

n = 9
puts (0..11).include?(n) ? "  - Constant #{ChineseZodiac.to_s(n)} has value #{n}" : "  - Wrong value #{n}."

puts "  - Is ChineseZodiac.to_s(#{n}) String? #{ChineseZodiac.to_s(n).is_a? String}"

def who_is_who
   print "Input the year of your birth, please: "
   year = gets.strip.to_i
   puts "Take it easy man, but you're #{ChineseZodiac.to_s(year % 12)}!"
end

puts "__Who_is_Who__".center(30)
who_is_who