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
        anagrams.add AnagramsKata::Word.new(line.strip)
      end
      anagrams.groups
    end

  end

end


def get_memory_usage
  "#{`ps -o rss= -p #{Process.pid}`.to_i}k"
end

#require 'benchmark'
#
#puts "Memory usage before reading input file: #{get_memory_usage}"
#anagrams = AnagramsKata::AnagramFinder.new('../../wordlist.txt').find_anagrams
#puts "Memory usage after finding anagrams: #{get_memory_usage}"
#
##anagrams.each { |group|  puts group.join(' ') }
#
#puts "Benchmark:"
#puts Benchmark.measure { AnagramsKata::AnagramFinder.new('../../wordlist.txt').find_anagrams }
