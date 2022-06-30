class Dog < Savable

  attr_accessor :name, :age, :breed, :image_url, :last_fed_at, :last_walked_at
  
  # deliverable: add a #feedings method to the Dog class to indicate a one to many relationship between the two.
  # since feeding belongs to a dog, dog is going to have many feedings, this is represented by a collection (aka array)
  # ONE TO MANY RELATIONSHIP (aka 'has_many') > ONE (dog) object has MANY instances (feedings (use PLURAL)) of another class 

  def feedings 
    # goal of this method: look at all our feeding instances and return an array of only the ones that belong to the instance we are calling feeding on (use self)
    # Feeding.all is from savable.rb which returns an array of all the feedings
    # select method will return a new array containting all elements for which the given block returns a true value
    # |feeding| means for each feeding
    # feeding.dog is calling on the :dog in Feeding class
    # self refers to that instance (dog) that feeding is called on
    Feeding.all.select {|feeding| feeding.dog == self}
  end

  # one dog has many dog_walks
  # select will filter through all the DogWalks to find which walk belongs to self(dog)
  # returns an array of all the dog_walks belonging to self
  def dog_walks
    DogWalk.all.select do |dw| 
      # binding.pry
      dw.dog == self
    end
  end

  # create a new array of all the walk instances of THAT dog
  def walks
    dog_walks.map{|dw| dw.walk}
  end

  # 
  def walk
    DogWalk.create(
      dog: self,
      walk: Walk.new(time: Time.now)
    )
  end
  
  # deliverable: update the dog's #feed method so that it creates a new feeding that belongs to the dog.
  # zoie.feed 
    # Feeding.create will create and save
    # associate to self(the dog .feed is being called on)

  def feed
    Feeding.create(time: Time.now, dog: self)
  end

  # print details about a dog (including the last walked at and last fed at times)
  def print
    puts
    puts self.name.green
    puts "  Age: #{self.age}"
    puts "  Breed: #{self.breed}"
    puts "  Image Url: #{self.image_url}"
    puts "  Last walked at: #{format_time(self.last_walked_at)}"
    puts "  Last fed at: #{format_time(self.last_fed_at)}"
    puts
  end


  private

  def formatted_name
    if self.last_fed_at.nil? && self.last_walked_at.nil?
      "#{self.name} (hungry and needs a walk)".red
    elsif self.last_fed_at.nil?
      "#{self.name} (hungry)".red
    elsif self.last_walked_at.nil?
      "#{self.name} (needs a walk)".red
    else
      self.name.green
    end
  end

  def format_time(time)
    time && time.strftime('%l:%M %p on %Y-%m-%d')
  end
end

