def rpncalc(str)
  arr1 = str.split(" ")
  arr2 = []
  operator = ["+", "-", "*", "/"]
  until arr1.empty?
    item = arr1.shift
    if !operator.include?(item)
      arr2.push(item.to_i)
    else
      arr2 << arr2.pop(2).inject(item.to_sym)
    end
  end
  arr2.first
end

if __FILE__ == $PROGRAM_NAME
  p rpncalc(ARGV[0])
end

#p rpncalc("5 1 2 + 4 * + 3 -")
