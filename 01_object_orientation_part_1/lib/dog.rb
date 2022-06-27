require 'pry'
require_relative './dogs_data.rb'

class Dog
  # macro: a macro is a class method that creates instance methods
    # attr_accessor: gives us both a setter and getter method in one single line
    attr_accessor(:name, :age, :breed)

    # attr_reader: which will only create the getter method
    # attr_writer: which will only create the setter method
  
  # ✅ we should be able to create dogs with a name, age, breed, and image_url
  
  # this instance method sets all the rules upon creating an instance, will automatically be called when the .new method is invoked
  # def initialize(name, age, breed) # we are setting these instance variables set to the values we are passing in
  #   @name = name #here we are creating an instance variable 
  #   @age = age # instance varibles are private to the instance
  #   @breed = breed
  # end

  # adding a new instance:
  # zoie = Dog.new("zoie", 2, "daschund")
  # => #<Dog:0x0000558adc6a3058 @age=2, @breed="daschund", @name="zoie">


  # mass assignment: allows us to pass in a hash and then create the properties based on the keys in the hash
  # when we call .new, we need to pass in a hash
  # when we iterate over a key using a method like .each, we are going to work with 2 values, key and value
  def initialize(attributes = {})
    attributes.each do |attr, value| # block variables only accessible between the do and end
      self.send("#{attr}=", value) # invoking on the setter method to set the value
      # self: here refers to the instance this method is being called on
    end
  end

  # zoie = Dog.new({name:"zoie", age: 2, breed: "daschund"})
  # getter method/reader method for each property
  # purpose: to read/access values
  # def name # this is a instance method (this method can only be called on an instance)
  #   # calling upon our instances through an implicit self
  #   # self is always going to refer the the receiver of the method
  #   @name
  # end

  # access name:
  # zoie.name
  # => "zoie"


  # setter method/writer method for each property: method name (name=) and argument((name))
  # purpose: to reassign values
  # def name=(name)
  #   @name = name
  # end

  # update name:
  # zoie.name = "bob"
  # => "bob"


  # ✅ we want to be able to access a dog's name, age, breed, image_url, last_fed_at and last_walked at times



  # ✅ we want to be able to print details about a dog (this time including the last walked at and last fed at times)


end
binding.pry