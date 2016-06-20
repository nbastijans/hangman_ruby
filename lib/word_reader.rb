class WordReader
  class << self
    def insert_in_storage(storage)
      data = File.readlines("wordlist.txt")
      data.each do |value|
        storage.insert(value)
      end
    end
  end
end
