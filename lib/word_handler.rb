# frozen_string_literal: true
class WordHandler
  class << self
    def guess(word, letter)
      while word.use_letter(letter)
        if hits_a_char(word, letter)
          hit_pos = hit_at_index(word, letter)
          enter_guessed_word(word, letter, hit_pos)
          return true
        else
          return false
        end
      end
    end

    private

    def hits_a_char(word, letter)
      word.word.include? letter
    end

    def hit_at_index(word, letter)
      indexes = []
      word.word.each.with_index do |value, index|
        indexes << index if value == letter
      end
      indexes
    end

    def enter_guessed_word(word, letter, pos)
      pos.each do |position|
        word.word_guess[position] = letter
      end
      word.use_letter(letter)
    end
  end
end
