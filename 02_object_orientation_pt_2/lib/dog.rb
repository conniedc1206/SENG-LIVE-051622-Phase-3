require 'pry'

class Dog
  attr_accessor :name, :age, :breed, :image_url, :last_fed_at, :last_walked_at

  # ✅ 1. class variable: all - holds all dogs we have saved
  # @variable_name > instance variable
  # @@variable_name > class variable 
  @@all = []

  # ✅ 2. class method: 'all' - retrieves the value of the class variable
  # should this be a class method or an instance method? if it is operating on the entire class, it's going to be a class method
  # using self instead of Dog so that we can reuse this logic/it can be "inherited" by other classes/self will reference the class that it's called on (makes this method more reusable and dynamic)
  def self.all
    @@all
  end

  # ✅ 4. class method: 'create' - creates a new instances and saves it to the class variable
  def self.create(attributes = {})
    new_dog = self.new(attributes) # self = Dog
    new_dog.save
    # refactor using method chaining
    # self.new(attributes).save
  end

  # initialize with an optional hash of attributes: when we call .new, do this initialize
  def initialize(attributes = {})
    attributes.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    # save
  end

  # ✅ 3. instance method: 'save' - saves this dog instance to our class variable
  def save
    @@all << self
  end

  # ✅ 5. instance method: 'walk' - updates the dog's last_walked_at property to the current time
  # Time.now will give you your current time
  def walk
    self.last_walked_at = Time.now
  end
  
  # ✅ 6. instance method: 'feed' - updates the dog's last_fed_at property to the current time
  def feed
    self.last_fed_at = Time.now
  end

  # print details about a dog (including the last walked at and last fed at times)
  def print
    puts
    puts formatted_name
    puts "  Age: #{self.age}"
    puts "  Breed: #{self.breed}"
    puts "  Image Url: #{self.image_url}"
    puts "  Last walked at: #{self.last_walked_at}"
    puts "  Last fed at: #{self.last_fed_at}"
    puts
  end

  # private method: a method that is not accesible outside of the class that its been defined
  # need to add "private" keyword, usually at the bottom of the code
  # use it when you want information to secure (like with strong params in Rails), it will make your data less vunerable
  private

  # ✅ 7. private method: '#formatted_name' - returns the name of the dog color coded to indicate whether they are hungry or need a walk
  def formatted_name
    if self.last_fed_at.nil? && self.last_walked_at.nil?
      "#{self.name} hungry and needs a walk"
    elsif self.last_fed_at.nil?
      "#{self.name} is hungry"
    elsif self.last_walked_at.nil?
      "#{self.name} needs a walk"
    else
      self.name
    end
  end

  # ✅ 8. private method: '#format_time(time)' - accepts a time and returns it in a human readable format
  # should look like this: "Monday, 04/18/22 10:12 AM"
  # use strftime()
  time && time.strftime('%l: %M %p on %Y-%m-%d')
end

# this is how we invoke a class method
# Dog.all

archie = Dog.create({name: "archie", breed: "pug", age: 1, image_url: "image.com"})
binding.pry
