# frozen_string_literal: true

class Word
  attr_reader :kanji, :pronunciation

  def initialize(kanji, pronunciation)
    @kanji = kanji
    @pronunciation = pronunciation
  end
end
