class Definitions
  attr_reader(:definition)

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
  end
  define_method(:sentence) do
    sentence = ""
    sentence += @definition
  end
end
