class Cat
  # give me BOTH the readers and writers
  attr_accessor :name, :age, :toys

  def initialize(name, age)
    @name = name
    @age = age
    @toys = []
  end

  def meow
    return name + " says meow!"
  end

  def add_toy(name)
    # mutates the cat's toys array. Does not re-assign the cat's toys array.
    toys << name

    # this does NOT mutate the toys array, it builds a new array, and mutates
    # the cat by re-assigning the toys instance variable to refer to the
    # new array.
    self.toys = self.toys + [name]
  end

  # getter methods!
  # def age
  #   return @age
  # end
  #
  # def name
  #   return @name
  # end

  # Macro: Class method, that defines more methods. Metaprogramming.
  # def self.my_attr_reader(*property_names)
  #   property_names.each do |property_name|
  #     define_method(property_name) do
  #       # inside here self == a cat instance
  #       self.instance_variable_get("@#{property_name}")
  #     end
  #   end
  # end

  # attr_reader :name, :age

  # setter methods!
  # def self.my_attr_writer(*property_names)
  #   property_names.each do |property_name|
  #     define_method("#{property_name}=") do |value|
  #       self.instance_variable_set("@#{property_name}", value)
  #     end
  #   end
  # end

  # def age=(new_age)
  #   @age = new_age
  # end
  #
  # def name=(new_name)
  #   # MUTATES the cat instance
  #   @name = new_name
  # end

  # attr_writer :name, :age
end

$curie = Cat.new("Curie", 2)
$markov = Cat.new("Markov", 1)
