class Hangman
  attr_accessor :p1, :p2, :guessed_word

  def initialize(p1, p2)
    @p1, @p2 = [p1, p2]
    @guessed_word = []
  end

  def play
    setup

    loop do
      display
      my_guess = p2.guess
      indexes = p1.check_guess(my_guess)
      p2.handle_guess_response(indexes, my_guess)

      update_state(indexes, my_guess)

      break if guessed_word.none? { |l| l == "_" }
    end

    display
    puts "Player 2 wins!"
  end

  def display
    puts guessed_word.join(" ")
  end

  def setup
    word_len = p1.pick_secret_word
    p2.receive_secret_length(word_len)
    word_len.times { |i| guessed_word[i] = "_" }
  end

  def update_state(indexes, my_guess)
    indexes.each do |i|
      guessed_word[i] = my_guess
    end
  end
end

class HumanPlayer
  def pick_secret_word
    puts "Pick a word and write it down (on paper!)"
    print "How long is it?"
    gets.chomp.to_i
  end

  def receive_secret_length(len)
    puts "The word is #{len} letters long."
  end

  def guess
    print "Guess a letter: "
    gets.chomp
  end

  def check_guess(g)
    print "What indexes is the letter #{g} in? "
    gets.scan(/[0-9]+/).map &:to_i
  end

  def handle_guess_response(indexes, my_guess)
    puts "These indexes have the letter #{my_guess}:"
    p indexes
  end
end

class ComputerPlayer
  attr_reader :secret_word
  attr_accessor :file_content, :alphabet, :guessed_word

  def initialize
    @file_content = File.readlines("dictionary.txt").map(&:chomp)
    @alphabet = ('a'..'z').to_a
    @guessed_word = []
  end

  def pick_secret_word
    # @secret_word = 'camping'
    @secret_word = file_content.sample
    @secret_word.length
  end

  def receive_secret_length(len)
    self.file_content.reject! { |word| word.length != len }
    len.times { |i| guessed_word[i] = "_" }
  end

  def guess
    self.file_content.select! do |word|
      regex = Regexp.new guessed_word.join.gsub('_','.')
      regex === word
    end

    if file_content.length == 1
      puts "I know the word! It's '#{file_content.first}'"
      exit
    end

    letter_occ = Hash.new(0)
    file_content.each do |word|
      word.split('').each do |l|
        letter_occ[l] += 1
      end
    end

    letter_occ = letter_occ.sort_by { |k, v| v }.reverse
    letter_occ.select! { |(k, v)| alphabet.include? k }
    result = letter_occ.first.first
    alphabet.reject! { |c| c == result }
    result
  end

  def check_guess(g)
    indexes = []
    secret_word.split('').each_with_index do |item, i|
      indexes << i if item == g
    end
    indexes
  end

  def handle_guess_response(indexes, my_guess)
    indexes.each do |i|
      guessed_word[i] = my_guess
    end
  end
end

p1 = HumanPlayer.new
p2 = HumanPlayer.new
c1 = ComputerPlayer.new
c2 = ComputerPlayer.new
g = Hangman.new(c1, c2)
g.play
