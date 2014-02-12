module AnagramsKata

  class Anagrams

    def initialize
      @groups = {}
    end



    def add(word)
      @groups[word.key] = [] unless @groups.has_key?(word.key)
      @groups[word.key] << word.word
    end



    def groups
      @groups.values
    end
  end

end

