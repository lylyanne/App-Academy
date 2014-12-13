def shuffle(input_name)

  lines = File.readlines("#{input_name}.txt").map(&:chomp)
  lines.shuffle!
  File.open("#{input_name}-shuffle.txt", "w") do |f|
    lines.each do |line|
      f.puts line
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV == []
    puts "what file do you want to shuffle?"
    response = gets.chomp
    shuffle(response)
  else
    shuffle(ARGV[0])
  end
end
