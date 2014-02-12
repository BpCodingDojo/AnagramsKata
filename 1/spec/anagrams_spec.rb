require 'spec_helper'

describe Anagrams do

  describe ".group" do
    it 'should return no group on empty row set' do
      expect(Anagrams.group []).to eq []
    end


    it 'should return one group on single row' do
      expect(Anagrams.group ['malacka']).to eq [['malacka']]
    end


    it "should sort differrent anagrams into different groups" do
      expect(Anagrams.group ['malacka', 'micimacko']).to eq [['malacka'], ['micimacko']]
    end


    it "should sort the same words into the same group" do
      expect(Anagrams.group ['malacka', 'malacka']).to eq [['malacka', 'malacka']]
    end


    it "should sort the same anagrams into the same group" do
      expect(Anagrams.group ['malacka', 'alackam']).to eq [['malacka', 'alackam']]
    end


    it "should handlemultiple groups" do
      expect(Anagrams.group ['malacka', 'alackam', "almafa", "amlafa"]).to eq [['malacka', 'alackam'], ["almafa", "amlafa"]]
    end


    it "should ignore case" do
      expect(Anagrams.group ['malacka', 'AlAcKaM']).to eq [['malacka', 'AlAcKaM']]
    end

  end
end

#describe FileLoader do
#  describe "load" do
#    it "should work with real file" do
#
#    end
#
#
#    it "should return an array of words contained by the file" do
#      pending
#      expect(File).to receive(:open).with("some_filename.txt").and_return("")
#      expect(FileLoader.load)
#    end
#  end
#end