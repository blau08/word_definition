class Words
  attr_reader(:word)

  @@all_words = []

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@all_words.length + 1
    @definition_list = []
  end
  define_method(:save) do
    @@all_words.push(self)
  end
  define_singleton_method(:all) do
    @@all_words
  end
  define_singleton_method(:clear) do
    @@all_words = []
  end
  define_method(:id) do
    @id
  end
  define_singleton_method(:find) do |find_id|
    found_word = nil
    @@all_words.each() do |word|
      if word.id() == find_id
        found_word = word
      end
    end
    found_word
  end
  define_method(:add_definition) do |new_definition|
    @definition_list.push(new_definition)
  end
  define_method(:display_definitions) do
    @definition_list
  end
  define_method(:clear_definitions) do
    @definition_list = []
  end
end
