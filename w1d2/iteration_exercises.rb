def factor(num)
  factors = []
  (1..num / 2).each do |i|
    if num % i == 0
      factors << i
      factors << num / i
    end
  end
  factors.uniq.sort
end

# p factor(9)
# p factor(20)


def bubble_sort(arr)
  arr.length.times do
    arr.length.times  do |i|
      next if i == arr.length-1
      if arr[i + 1] < arr[i]
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
    end
  end
  arr
end

#p bubble_sort([5, 4, 3, 2, 1])

def substrings(str)
  substrings = []
  str.length.times do |i|
    (i..(str.length - 1)).each do |j|
      substrings << str[i..j]
    end
  end
  substrings
end

# substrings("cat")

def subwords(word)
  real_words = []
  diction = File.readlines("dictionary.txt").map(&:chomp)
  substrings(word).each do |i|
    real_words << i if diction.include?(i)
  end
  real_words
end


p subwords("masterpiece")
