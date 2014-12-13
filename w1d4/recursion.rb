def range(start, end_num)
  if end_num < start
    return []
  else
    [start] + range(start + 1, end_num)
  end
end

def sum_rec(array)
  if array.count == 0
    return 0
  else
    array.shift + sum_rec(array)
  end
end


def sum_it(array)
  total = 0
  array.each do |el|
    total+=el
  end
  total
end

def recursion1(base, pow)
  return 1 if pow == 0
  base * recursion1(base, pow-1)
end

def recursion2(base, pow)
  return 1 if pow == 0
  if pow.even?
    recursion2(base, pow / 2) * recursion2(base, pow / 2)
  else
    base * recursion2(base, (pow - 1) / 2) * recursion2(base, (pow - 1) / 2)
  end
end
