# frozen_string_literal: true
class WordReader
  class << self
    def insert_in_storage(storage)
      data = File.readlines("wordlist.txt")
      data.each do |value|
        storage.insert(value.chomp)
      end
    end
  end
end
