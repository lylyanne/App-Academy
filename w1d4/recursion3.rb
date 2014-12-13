def make_change(amount, coin_array)
  output_array = []
  return output_array if coin_array.empty?
  until amount < coin_array[0]
    output_array << coin_array[0]
    amount-=coin_array[0]
    # p amount
    # p output_array
  end
  output_array + make_change(amount, coin_array.drop(1))
end


def make_change2(amount, coin_array)
  output_array = []
  return output_array if coin_array.empty?
  if amount > coin_array[0]
    output_array << coin_array[0]
    amount-=coin_array[0]
    # p amount
    # p output_array
  end
  output_array + make_change(amount, coin_array.drop(1))
end

def make_change3(amount, coin_array)
  output_array = []
  best = [1,1,1,1,1,1,1,1,1]
  return output_array if amount==0

  coin_array.each do |coin|
    if amount > coin
      output_array << coin
      make_change3(amount - coin, coin_array)
    end
    if output_array.count < best.count
      best = output_array
    end
  end
  best
end
#
#
#   current_output = output_array + make_change(amount, coin_array.drop(1))
#   if current_output.cound < best_output_array.count
#     best_output_array.count ==
#
#   if amount > coin_array[1]
#     output_array << coin_array[1]
#     amount-=coin_array[1]
#   end
#
#   other_output = output_array + make_change(amount, coin_array.drop(2))
#
#   if current_output.count < other_output.count
#     best_output_array = current_output
#   else
#     best_output_array = other_output
#   end
#
#   best_output_array
# end

p make_change3(14, [10, 7, 1])
