require 'set'

class WordChainer
  attr_accessor :dictionary

  def initialize(file_name)
    @dictionary = Set.new(File.readlines(file_name).map(&:chomp))
  end

  def adjacent_words(word)
    adjacent_words = []
    dictionary.each do |dict_word|
      next if dict_word.length != word.length

      adjacent_words << dict_word if adjacent_word?(word, dict_word)
    end
    adjacent_words
  end

  def adjacent_word?(word, dict_word)
    count = 0
    word.split('').each_with_index do |l, i|
      count += 1 if dict_word[i] != l
    end
    count == 1 ? true : false
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]
    until @current_words.empty? || @all_seen_words.include?(target)
      explore_current_words

      #new_current_words = []
      # @current_words.each do |word|
      #   adjacent_words = adjacent_words(word)
      #   adjacent_words.each do |adj_word|
      #     next if @all_seen_words.include?(adj_word)
      #
      #     new_current_words << adj_word
      #     @all_seen_words << adj_word
      #     #p new_current_words
      #   end
      # end
      #puts new_current_words
      #@current_words = new_current_words
    end
    puts "Exit the loop"
  end

  def explore_current_words
    new_current_words = []

    @current_words.each do |word|
      adjacent_words = adjacent_words(word)
      adjacent_words.each do |adj_word|
        next if @all_seen_words.include?(adj_word)

        new_current_words << adj_word
        @all_seen_words << adj_word
      end
    end
    @current_words = new_current_words
  end
end

w = WordChainer.new("dictionary.txt")
#p w.dictionary[0..5]
p w.adjacent_word?("dog", "fog")
p w.adjacent_word?("dog", "gof")
p w.adjacent_words("inter")
p w.run("diner", "liver")
