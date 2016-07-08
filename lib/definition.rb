class Definition
  @@definitions = []
  attr_reader(:description, :partofspeech, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @partofspeech = attributes.fetch(:partofspeech)
    @id = @@definitions.length().+(1)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_method(:save)do
    @@definitions.push(self)
  end

  define_singleton_method(:all) do
    @@definitions
  end

end
