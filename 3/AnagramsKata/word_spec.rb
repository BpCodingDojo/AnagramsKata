require_relative 'word'

module AnagramsKata
  describe Word do

    describe '#key' do

      context 'when created with an empty string' do

        it 'should return an empty string' do

          expect(Word.new('').key).to eq ''
        end

      end

      context 'when created with a non empty string' do

        it 'should return the word ABC ordered' do

          expect(Word.new('cba').key).to eq 'abc'
        end

      end
    end

  end
end

