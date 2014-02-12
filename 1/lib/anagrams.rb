class Anagrams
  def self.group(rows)
    word_hash = WordHash.new

    rows.each do |row|
      word_hash.append row
    end

    groups = []

    word_hash.each_group do |group|
      groups << group
    end

    groups
  end
end


class WordHash
  def initialize()
    @hash = {}
  end



  def append(word)
    hashed_word = hash_word(word)

    @hash[hashed_word] ||= []
    @hash[hashed_word] << word
  end



  def each_group
    @hash.each do |key, group|
      yield group
    end
  end



  private

  def hash_word(row)
    row.upcase.split("").sort.join
  end

end