class DogsController < ApplicationController
    # create a route that returns a response of all dogs (Dog.all)
    # index : this is a path that will return the collection of a resource
    # follow REST conventions to create and define enpoints
    get '/dogs' do
        # dogs = Dog.all
        # dogs.to_json
        Dog.all.to_json
    end


    # create a dynamic route that reponses with a single dog given the ID parameter
    # how is the id supplied? :id is dynamic/acts like a placeholder for the value
    # how do we access the id?
    # params: receive params through a dynamic route OR any data was submitted through a form
    get '/dogs/:id' do
        dog = Dog.find(params[:id])
        dog.to_json
    end

end