require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition')
require('./lib/word')

get('/') do
  @words = Word.all()
  erb(:index)
end

# get('/words') do
#   @words = Word.all()
#   erb(:words)
# end

get('/words/new') do
  erb(:words_form)
end

post('/words') do
  name = params.fetch("name")
  @word = Word.new({:name => name}).save()
  erb(:word_success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word_definitions_form)
end

post('/definitions') do
  description = params.fetch('description')
  partofspeech = params.fetch('partofspeech')
  @definition = Definition.new({:description => description, :partofspeech => partofspeech})
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:definition_success)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end
