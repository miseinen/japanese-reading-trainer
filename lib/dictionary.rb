# frozen_string_literal: true

require_relative 'word'

class Dictionary
  attr_reader :words

  def initialize(path)
    @words = []
    extract_words(path)
  end

  private

  def extract_words(path)
    file = File.open(path, 'r')
    file.each_line do |line|
      next if line.empty?

      columns = line.split(',')
      words << Word.new(columns[2].strip, columns[4].strip)
    end
    file.close
  end
end
