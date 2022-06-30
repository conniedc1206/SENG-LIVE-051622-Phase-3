# add a Feeding class to the application that inherits from Savable

class Feeding < Savable
    # deliverable: add #dog and #dog= methods to the Feeding class to indicate a one to one relationship between the two.
    # associate every new feeding to a dog by ONE to ONE relationship (aka belongs_to relationship) (when we create a new feeding, we want to know which dog it belongs to)
        # f = Feeding.new
        # zoie = Dog.new(name: "zoie")
        # f.dog = zoie > method is SINGULAR + when we are setting dog value, it sets an instance of dog
        # f => Feeding, @dog
    attr_accessor :dog, :time # gives us BOTH a reader and writer method
end