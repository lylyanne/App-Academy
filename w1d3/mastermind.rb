class Code
  COLORS = %w(R G B Y O P)

  attr_accessor :secret

  def self.random
    Code.new( (1..4).map { COLORS.sample } )
  end

  def self.parse(input)
    parsed_input = input.scan(/[RBGYOP]/)
    Code.new(parsed_input)
  end

  def initialize(secret)
    @secret = secret
  end

  def exact_matches(other_code)
    count = 0
    4.times do |i|
      count += 1 if secret[i] == other_code.secret[i]
    end
    count
  end

  def near_matches(other_code)
    count = 0
    secret = self.secret.dup
    secret2 = other_code.secret.dup

    secret.each_with_index do |color, i|
      if secret[i] == secret2[i]
        secret[i] = secret2[i] = nil
      end
    end

    secret.each_with_index do |color, i|
      next if color.nil?
      if secret2.include?(color) && secret2.index(color) != i
        secret[i] = nil
        secret2[secret2.index(color)] = nil
        count += 1
      end
    end

    count
  end
end

class Game
  attr_accessor :code

  def initialize
    @code = Code.random
  end

  def play
    10.times do
      guess = get_input
      
      exact, near = code.exact_matches(guess), code.near_matches(guess)
      puts "You have #{exact} exact matches and #{near} near matches."
      if exact == 4
        puts "You win!"
        return
      end
    end
    puts "You lose!"
  end

  def get_input
    puts "Enter a guess: "
    Code.parse(gets.chomp)
  end
end

code2 = Code.new(%w(R G B Y))
code1 = Code.new(%w(G Y Y Y))
# p code1
# p code2
# p code1.exact_matches(code2)
# p code1.near_matches(code2)
# p code1
# p code2

m = Game.new
p m.code.secret
m.play
