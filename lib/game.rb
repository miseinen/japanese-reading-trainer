# frozen_string_literal: true

class Game
  attr_reader :dictionary

  LINE = '=' * 40

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def play
    word = random_word
    puts "Guess how #{word.kanji} is reading: "
    reading = gets.chomp
    if reading == word.reading
      puts "Correct!\n#{LINE}"
    else
      guess_loop(word.reading)
    end
  end

  private

  def random_word
    random = rand(@dictionary.words.count)
    @dictionary.words[random]
  end

  def guess_loop(word_reading)
    puts 'Try again:'
    reading = gets.chomp
    if reading == word_reading
      puts "Correct!\n#{LINE}"
      return
    end
    puts "Correct answer is #{word_reading}\n#{LINE}"
  end
end
