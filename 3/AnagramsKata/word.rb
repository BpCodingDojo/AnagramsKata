module AnagramsKata
  class Word

    def initialize(string)
      @word = string
    end

    def key
      @word.split('').sort.join
    end
  end

end