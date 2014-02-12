module AnagramsKata

  class Anagrams

    def initialize
      @groups = []
    end



    def add(word)
      if @groups.empty?
        @groups << []
      end

      @groups.first << word.word
    end



    def groups
      @groups
    end
  end

end

