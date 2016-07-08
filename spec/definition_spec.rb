require('rspec')
require('word')
require('definition')

describe(Definition) do
  # before() do
  #   Definition.clear()
  # end

  describe('#description')do
    it('returns a description of the word')do
    test_definition = Definition.new({:description => "a very large bird", :partofspeech => "noun"})
    expect(test_definition.description()).to eq("a very large bird")
    end
  end

end
