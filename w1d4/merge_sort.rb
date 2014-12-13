def merge_sort(array)
  return array if array.length <= 1

  left, right, result = [], [], []
  middle = array.length / 2

  for i in 0..middle-1
    left << array[i]
  end
  for i in middle..array.length-1
    right << array[i]
  end
  left = merge_sort(left)
  right = merge_sort(right)
  if left.last <= right.first
    left = left + right
    return left
  end
  # p left
  #p right
  result = merge(left, right)
  result
end

def merge(left, right)
  result = []
  while left.length > 0 && right.length > 0
    if left.first <= right.first
      result << left.first
      left = left[1..-1]
    else
      result << right.first
      right = right[1..-1]
    end
  end
  if left.length > 0
    result = result + left
  end
  if right.length > 0
    result = result + right
  end
  result
end

p merge_sort([1,6,2,5])
#p merge([1,6],[2])
