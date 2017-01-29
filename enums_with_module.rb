module Enum
  def initialize(key, value)
    @key = key
    @value = value
  end

  def key
    @key
  end

  def value
    @value
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def add(key, value)
      @hash ||= {}
      @hash[key] = self.new(key, value)
    end

    def const_missing(key)
      @hash[key].value
    end

    def each
      @hash.each do |key, value|
        yield key, value
      end
    end

    def all
      @hash.values
    end

    def all_to_hash
      hash = {}
      each do |key, value|
        hash[key] = value.value
      end
      hash
    end
    
    def to_s(val)
      if (0..11).include?(val)
        @hash.keys.find {|key| @hash[key].value == val}.to_s
      else return
      end
    end
  end
end

class ChineseZodiac
    include Enum
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
end

puts ChineseZodiac::ROOSTER

puts "___Chinese_Zodiac___".center(30)

print "There are twelve totem animals in Chinese Zodiac: "
ChineseZodiac.each {|k, v| print "#{k} "}


puts "\n  - Value of ChineseZodiac::DOG is #{ChineseZodiac::DOG}"

n = 9
puts (0..11).include?(n) ? "  - Constant #{ChineseZodiac.to_s(n)} has value #{n}" : "  - Wrong value #{n}."

puts "  - Is ChineseZodiac.to_s(#{n}) String? #{ChineseZodiac.to_s(n).is_a? String}"

puts "\n", "__Who_is_Who__".center(30)

def who_is_who
   print "Input the year of your birth, please: "
   year = gets.strip
   while year.to_i.to_s != year
     puts "Wrong input. Try once more: "
     year = gets.strip
   end 
   puts "Take it easy man, but you're #{ChineseZodiac.to_s(year.to_i % 12)}!"
end

who_is_who