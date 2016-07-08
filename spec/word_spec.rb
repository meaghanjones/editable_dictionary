require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#name') do
    it('returns the name of the word') do
      test_word = Word.new({:name => "huge"})
      expect(test_word.name()).to(eq("huge"))
    end
  end

  describe('#id') do
    it('returns the id of the word') do
      test_word = Word.new({:name => "huge"})
      expect(test_word.id()).to(eq(1))
    end
  end


end
