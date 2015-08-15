require('rspec')
require('words')
require('definitions')

describe(Words) do
  before() do
    Words.clear()
  end

  describe('#word') do
    it('returns the word that the user inputs') do
      test_word = Words.new({:word => 'prodigy'})
      expect(test_word.word()).to(eq('prodigy'))
    end
  end

  describe('#save') do
    it('adds the word to the master list of words') do
      test_word = Words.new({:word => 'prodigy'})
      test_word.save()
      expect(Words.all()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('clears the master list of words') do
      test_word = Words.new({:word => 'prodigy'})
      test_word.save()
      Words.clear()
      expect(Words.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id number of a word') do
      test_word = Words.new({:word => 'prodigy'})
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('finds a word based on its id number') do
      test_word = Words.new({:word => 'prodigy'})
      test_word.save()
      expect(Words.find(1)).to(eq(test_word))
    end
  end

  describe('#add_definition') do
    it('adds a definition to the word') do
      test_definition = Definitions.new({:definition => 'a person, especially a young one, endowed with exceptional qualities or abilities.'})
      test_word = Words.new({:word => 'prodigy'})
      test_word.add_definition(test_definition)
      expect(test_word.display_definitions()).to(eq([test_definition]))
    end
  end
  
  describe('#clear_definitions') do
    it('clears the definitions of a word') do
      test_definition = Definitions.new({:definition => 'a person, especially a young one, endowed with exceptional qualities or abilities.'})
      test_word = Words.new({:word => 'prodigy'})
      test_word.add_definition(test_definition)
      test_word.clear_definitions()
      expect(test_word.clear_definitions()).to(eq([]))
    end
  end
end


describe(Definitions) do
  describe('#definition') do
    it('returns the definition of the word') do
      test_definition = Definitions.new({:definition => 'a person, especially a young one, endowed with exceptional qualities or abilities.'})
      expect(test_definition.definition()).to(eq('a person, especially a young one, endowed with exceptional qualities or abilities.'))
    end
  end
end
