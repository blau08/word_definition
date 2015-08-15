class Definitions
  attr_reader(:definition)

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
  end

  # remove unneeded method below (changed where needed to just call definition())
  # define_method(:sentence) do
  #   sentence = ""
  #   sentence = @definition
  # end
end
