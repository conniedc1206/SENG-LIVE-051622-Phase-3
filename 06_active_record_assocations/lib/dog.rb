class Dog < ActiveRecord::Base
    has_many :feedings 
    # this macro we will gain 17 methods related to the association:
    # .feedings => returns all the feedings associated with the instance it was called on i.e.zoie.feedings
    # .feedings << new instances of feedings (<< will add a new element to an array)
        # f = feedings.create(time: Time.current) 
        # zoie.feedings << f
    # feedings.build //another way to create a new feeding and associate it directly with the dog all in one step, caution: it WON'T save it to db
        # zoie.feedings.build(time: Time.current)
        # also need to call .save
    # feedings.create //creates a new feeding instance for the dog it's associated with AND it saves it to the dbA
        # zoie.feedings.create(time: Time.current)
end