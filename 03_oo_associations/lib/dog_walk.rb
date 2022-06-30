class DogWalk < Savable
    # deliverable: create a DogWalk class to manage the relationship between: a single dog and a single walk (via attr_accessors)
    # has_many :through relationship
        #  first, establish a singular class that connects the two classes (aka a bridge and like a JOIN table)
        # second: inside dog and walk, can return all the connect instances
        # e.g. YELP

    attr_accessor :dog, :walk #these two classes are not related in any way

    
end