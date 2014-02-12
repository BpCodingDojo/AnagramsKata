require 'rspec'

class AnagramFinder

  def find_in_text(words_text)
    prepare_output_from_groups group_words_by_anagrams words_from_text words_text
  end



  private

  def words_from_text(words_text)
    words_text.split("\n").map { |word_lines| word_lines.split " " }.flatten
  end



  def group_words_by_anagrams(words)
    groups = {}

    words.each do |word|
      anagram_key = generate_anagram_key_for word
      groups[anagram_key] = [] unless groups.has_key? anagram_key
      groups[anagram_key] << word
    end

    groups
  end



  def generate_anagram_key_for(word)
    word.downcase.chars.map { |c| c }.sort
  end



  def prepare_output_from_groups(groups)
    groups.map { |_, anagrams| anagrams.join " " }.join "\n"
  end

end


describe AnagramFinder do

  describe "#find_in_text" do
    context "when the input contains a single word" do
      it "should return the same word" do
        expect(subject.find_in_text "almafa").to eq "almafa"
        expect(subject.find_in_text "kortefa").to eq "kortefa"
      end
    end


    context "when the input contains multiple words" do
      context "when there are no anagrams" do
        it "should return the same words" do
          expect(subject.find_in_text "almafa\nkortefa").to eq "almafa\nkortefa"
        end
      end

      context "when a word is repeated" do
        {
          "almafa\nalmafa" => "almafa almafa",
          "almafa\nkortefa\nalmafa" => "almafa almafa\nkortefa",
        }
        .each do |input_text, expected_output|
          it "should return the words on a single line" do
            expect(subject.find_in_text input_text).to eq expected_output
          end
        end
      end

      context "when there are anagrams" do
        {
          %w[kinship enlist inlets listen pinkish silent] => "kinship pinkish\nenlist inlets listen silent",
          %w[almafa alamaf] => "almafa alamaf"
        }
        .each do |input_text, expected_output|
          it "should group anagrams on the same line" do
            expect(subject.find_in_text input_text.join "\n").to eq expected_output
          end
        end
      end
    end


    it "should be case-insensitive" do
      expect(subject.find_in_text "almafa\nAlmafa").to eq "almafa Almafa"
    end


    context "when there are multiple words in a single input line" do
      it "should treat them as separate input words" do
        expect(subject.find_in_text "kinship enlist inlets\nlisten pinkish silent").to eq "kinship pinkish\nenlist inlets listen silent"
      end
    end
  end

end



def get_memory_usage
  "#{`ps -o rss= -p #{Process.pid}`.to_i}k"
end



require 'benchmark'

puts "Memory usage before reading input file: #{get_memory_usage}"
input_text = File.read "../wordlist.txt", encoding: "UTF-8"
puts "Memory usage after reading input file: #{get_memory_usage}"
anagrams = AnagramFinder.new.find_in_text(input_text)
puts "Memory usage after finding anagrams: #{get_memory_usage}"

puts "Benchmark:"
puts Benchmark.measure { AnagramFinder.new.find_in_text(input_text) }
