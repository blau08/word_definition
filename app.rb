require('sinatra')
require('sinatra/reloader')
require('./lib/words')
require('./lib/definitions')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @@words = Words.all()
  erb(:index)
end

post('/new_word') do
  word = params.fetch('word')
  @word = Words.new({:word => word})
  @word.save()
  redirect('/')
end

get('/word/:id') do
  @word = Words.find(params.fetch('id').to_i())
  erb(:word)
end

post('/new_definition') do
  definition = params.fetch('definition')
  id = params.fetch('word_id')
  new_definition = Definitions.new({:definition => definition})
  @word = Words.find(id.to_i())
  @word.add_definition(new_definition)
  redirect('/word/' + @word.id().to_s())
end

post('/clear_definitions') do
  id = params.fetch('word_id')
  @word = Words.find(id.to_i())
  @word.clear_definitions()
  redirect('/word/' + @word.id().to_s())
end
