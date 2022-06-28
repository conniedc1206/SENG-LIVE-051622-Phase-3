# these methods that you will use in a lot of classes, add it here and inherit it to the other classes

class Savable
    @@all = []

    def self.all
        @@all
    end

    def initialize(attributes = {})
        attributes.each do |attribute, value|
        self.send("#{attribute}=", value)
        end
    end

    def save
        @@all << self
    end

    def self.create(attributes = {})
        self.new(attributes).save
    end
end