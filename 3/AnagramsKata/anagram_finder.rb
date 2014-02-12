require_relative 'anagrams'
require_relative 'word'

module AnagramsKata

  class AnagramFinder


    def initialize(filename)
      @filename = filename
    end



    def find_anagrams
      anagrams = AnagramsKata::Anagrams.new
      File.open(@filename, 'r').each_line do |line|
        anagrams.add AnagramsKata::Word.new(line)
      end
      anagrams.groups
    end

  end

end