class Feeding < ActiveRecord::Base
    belongs_to :dog # dog is the association
    # reader methods
    # .dog => will return the dog instance that the feeding belongs to
    # writer methods
    # .dog => set the dog that the feeding to i.e. feeding.dog = zoie
    # build_dog(dog attributes) => create a new dog instance, associatee it with the feeding we are calling this method on at the same time BUT it will not persist in db
    # create_association(dog attributes) => create a new dog instance, associate it with the feeding, and persist to db
end