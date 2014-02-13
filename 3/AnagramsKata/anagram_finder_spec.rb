#require_relative 'anagrams'
#require_relative 'word'
require_relative 'anagram_finder'

module AnagramsKata
  describe AnagramFinder do

    describe "#find_anagrams" do
      let(:file) { double 'file' }
      let(:finder) { AnagramFinder.new 'filename' }

      before :each do
        allow(File).to receive(:open).with('filename', 'r').and_return(file)
      end

      context "initialized with empty file" do

        it 'should return an emty array' do
          allow(file).to receive(:each_line)

          expect(finder.find_anagrams).to eq []
        end
      end

      context "initialized with a non empty file" do

        it 'should return anagram groups found in the file' do
          allow(file).to receive(:each_line).and_yield("alma\n").and_yield("korte\n").and_yield("lama\n")

          expect(finder.find_anagrams).to eq [['alma', 'lama'], ['korte']]
        end
      end

    end


  end

end