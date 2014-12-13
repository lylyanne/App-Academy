require 'byebug'

class Array
  def my_each(&prc)
    # byebug
    self.length.times do |index|
      prc.call self[index]
    end
    self
  end

  def my_map(&prc)
    mapped_ary = []
    self.my_each {|map_el| mapped_ary << prc.call(map_el)}
    mapped_ary
  end

  def my_select(&prc)
    select_ary = []
    self.my_each {|sel_el| select_ary << sel_el if prc.call(sel_el)}
    select_ary
  end

  def my_inject(&prc) # { |memo, el| memo += el }
    memo = self.first
    self.drop(1).my_each do |map_el|
      # next if self.index(map_el) == 0
      memo = prc.call(memo, map_el)
    end
    memo
  end

  def my_sort!(&prc)
    sorted = false
    until sorted
      sorted = true
      self.length.times do |i|
        next if i == self.length-1
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
    self
  end

end


a = [1,2,3,1]
b = ["a", "b", "c", "a"]

p a.my_inject { |sum, el| sum * el }
p a

p b.my_sort! { |num1, num2| num1 <=> num2 }
