# frozen_string_literal: true

class Game
  attr_reader :dictionary

  LINE = '=' * 40

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def play
    word = random_word
    puts "Guess how #{word.kanji} is pronounced: "
    pronunciation = gets.chomp
    if pronunciation == word.pronunciation
      puts "Correct!\n#{LINE}"
    else
      guess_loop(word.pronunciation)
    end
  end

  private

  def random_word
    random = rand(@dictionary.words.count)
    @dictionary.words[random]
  end

  def guess_loop(word_pronunciation)
    puts 'Try again:'
    pronunciation = gets.chomp
    if pronunciation == word_pronunciation
      puts "Correct!\n#{LINE}"
      return
    end
    puts "Correct answer is #{word_pronunciation}\n#{LINE}"
  end
end
