class Definition
  @@definitions = []
  attr_reader(:description, :partofspeech, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @partofspeech = attributes.fetch(:partofspeech)
    @id = @@definitions.length().+(1)
  end


end
