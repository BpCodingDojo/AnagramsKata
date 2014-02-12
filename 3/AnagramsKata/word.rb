module AnagramsKata
  class Word

    attr_reader :word



    def initialize(string)
      @word = string
    end



    def key
      @word.split('').sort.join
    end
  end

end