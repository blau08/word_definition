class Definitions
  attr_reader(:definition)

  @@definition_list

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
  end
end
