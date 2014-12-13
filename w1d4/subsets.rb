def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets(arr[0..-2])
  subs + subs.map { |x| x + [arr.last] }
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3, 4, 5])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
