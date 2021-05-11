# frozen_string_literal: true

class Game
  attr_reader :dictionary

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def play
    word = random_word
    puts "Guess how #{word.kanji} is pronounced: "
    pronunciation = gets.chomp
    until pronunciation == word.pronunciation
      puts 'Try again:'
      pronunciation = gets.chomp
    end
    puts 'Correct!'
  end

  private

  def random_word
    random = rand(@dictionary.words.count)
    @dictionary.words[random]
  end
end
