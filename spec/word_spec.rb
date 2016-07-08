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

  describe('#definitions') do
    it ("initially returns an empty array of definitions for the word") do
      test_word = Word.new({:name => "huge"})
      expect(test_word.definitions()).to eq([])
    end
  end

  describe('#save') do
    it ("adds a word to the array of saved words") do
      test_word = Word.new({:name => "huge"})
      test_word.save()
      expect(Word.all()).to eq ([test_word])
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Word.all()).to eq([])
    end
  end

  describe('.clear') do
    it("empties the saved words") do
      test_word = Word.new({:name => "huge"}).save()
      test_word.clear()
      expect(Word.all()).to eq ([])
    end
  end

  describe('.find') do
    it("return a word by it id number") do
      test_word1 = Word.new({:name => "huge"})
      test_word1.save()
      test_word2 = Word.new({:name => "ginourmous"})
      test_word2.save()
      expect(Word.find(test_word1.id())).to eq(test_word1)
    end
  end

  describe('#add_definition') do
    it('adds a definition to the word') do
      test_word1 = Word.new({:name => "folgado"})
      test_word1.save()
      test_definition = Definition.new({:description => "um cara que acha que tudo está sempre bem e gosta de abusar da boa vontade das outras pessoas", :partofspeech => "adjective"})
      test_definition.save()
      expect(test_word1.add_definition(test_definition)).to(eq([test_definition]))
    end
  end

end
