require_relative 'anagrams'
require_relative 'word'

module AnagramsKata

  describe Anagrams do

    describe '#add' do

      it 'should accept the added word' do
        Anagrams.new.add Word.new('alma')
      end

    end

    describe '#groups' do
      context 'when no word added' do
        it 'should return an empty array' do
          expect(subject.groups).to eq []
        end
      end

      context 'when words added' do
        it 'should return the anagram groups in an array for one word' do
          subject.add Word.new('alma')

          expect(subject.groups).to eq [['alma']]
        end

        it 'should return the anagram groups in an array for anagrams' do
          subject.add Word.new('alma')
          subject.add Word.new('alam')

          expect(subject.groups).to eq [['alma', 'alam']]
        end
      end
    end

  end

end
