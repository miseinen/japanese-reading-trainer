# frozen_string_literal: true

class Word
  attr_reader :kanji, :reading

  def initialize(kanji, reading)
    @kanji = kanji
    @reading = reading
  end
end
