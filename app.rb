require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')

get('/') do
  @words = Words.all()
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

post('/words')do
  name = params.fetch('name')
  Word.new(name).save()
  erb(:success)
end

get('/definitions/:id') do
  @defintion = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word_defintions_form)
end

post('/defintions') do
  description = params.fetch('description')
  partofspeech = params.fetch('partofspeech')
  @definition = Definition.new({:description => description, :partofspeech => partofspeech})
  @defintion.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_defintion(@definition)
  erb(:success)
end

get('/definitions/:id') do
  @defintion = defintion.find(params.fetch('id').to_i())
end
