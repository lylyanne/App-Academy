def rps(user_choice)
  selection_arr = ["Rock", "Paper", "Scissors"]
  get_result(user_choice, selection_arr.sample)
end

def get_result(user_choice, computer_choice)
  if user_choice == computer_choice
    return "#{computer_choice}, Draw"
  elsif user_choice == "Paper"
    return "#{computer_choice}, Lose" if computer_choice == "Scissors"
    return "#{computer_choice}, Win" if computer_choice == "Rock"
  elsif user_choice == "Rock"
    return "#{computer_choice}, Win" if computer_choice == "Scissors"
    return "#{computer_choice}, Lose" if computer_choice == "Paper"
  elsif user_choice == "Scissors"
    return "#{computer_choice}, Win" if computer_choice == "Paper"
    return "#{computer_choice}, Lose" if computer_choice == "Rock"
  end
end

# p rps("Rock") # => "Paper, Lose"
# p rps("Scissors") # => "Scissors, Draw"
# p rps("Scissors") # => "Paper, Win"

def remix(drink_matrix)
  alc_arr = []
  mix_arr = []
  drink_matrix.each do |mix|
    alc_arr << mix[0]
    mix_arr << mix[1]
  end
  alc_arr.shuffle!.zip(mix_arr.shuffle!)
end

# p remix([
#  ["rum", "coke"],
#  ["gin", "tonic"],
#  ["scotch", "soda"]
#  ])
