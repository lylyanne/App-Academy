def guess_game
  user_num, count = 0
  comp_num = (1..100).to_a.sample
  until user_num == comp_num
    puts "What is your guess?"
    user_num = gets.chomp
    if user_num == "q"
      puts "Quiter!"
      return nil
    end
    user_num = user_num.to_i
    comparison(user_num, comp_num)
    count += 1
  end
  puts "You won in #{count} turns"
end

def comparison(user_num, comp_num)
  if user_num > comp_num
    puts "Too High!"
  elsif user_num < comp_num
    puts "Too Low!"
  end
end

guess_game
