def fibonacci_it(n)
  arr = [1]

  n.times do |i|
    if arr.length==1
      arr << arr[-1]
    else
      arr << arr[-1]+arr[-2]
    end
  end
  arr

end

def fib_rec(n)
  if n<= 2
  [1,1].take(n)
  else
    fib = fib_rec(n-1)
    fib << fib[-2]+fib[-1]
  end
end

def bsearch(array, target)
  return nil if array.empty?

  mid = array.length / 2

  if array[mid] > target
    bsearch(array[0..mid-1], target)
  elsif array[mid] < target
    bsearch(array[mid+1..-1], target)
  else
    return mid
  end
end

p bsearch([1,2,3,4,5], 3)
p bsearch([1,2,3,4,5], 6)
