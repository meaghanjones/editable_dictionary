require('rspec')
require('word')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe('#description') do
    it('returns a description of a word') do
      test_definition = Definition.new({:description => "a very large bird", :partofspeech => "noun"})
      expect(test_definition.description()).to eq("a very large bird")
      end
    end

  describe('#partofspeech') do
    it('returns the part of speech to which a definition belongs') do
      test_definition = Definition.new({:description => "a very large bird", :partofspeech => "noun"})
      expect(test_definition.partofspeech()).to eq("noun")
    end
  end

  describe('#save') do
    it('saves the definition into an array') do
      test_definition = Definition.new({:description => "a very large bird", :partofspeech => "noun"})
      expect(test_definition.save()).to eq([test_definition])
    end
  end

  describe('.clear') do
    it('clears the array of saved definitions') do
      test_definition1 = Definition.new({:description => "um cara espaçoso", :partofspeech => "adjective"}).save()
      test_definition1.clear()
      expect(Definition.all()).to eq([])
    end
  end

      # describe('.clear') do
      #   it('clears the array of saved definitions') do
      #     test_definition1 = Definition.new({:description => "um cara espaçoso", :partofspeech => "adjective"}).save()
      #     test_definition2 = Definition.new({:description => "um cara que acha que tudo está sempre bem e gosta de abusar da boa vontade das outras pessoas", :partofspeech => "adjective"}).save()



end
