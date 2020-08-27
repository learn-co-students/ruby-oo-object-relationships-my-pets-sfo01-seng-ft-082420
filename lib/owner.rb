require  "pry"

class Owner
    attr_reader :name, :species
    @@all = []

    def initialize(name)
        @name = name
        @species = "human"
        @@all << self
    end

    def say_species
        return "I am a #{@species}."
    end

    def self.all
        @@all
    end

    def self.count
        @@all.size
    end

    def self.reset_all
        @@all = []
    end

    def cats
        Cat.all.select {|cat| cat.owner == self}
    end

    def dogs
        Dog.all.select {|dog| dog.owner == self}
    end

    def buy_cat(cat)
        Cat.new(cat, self)
    end

    def buy_dog(dog)
        Dog.new(dog, self)
    end

    def walk_dogs
        self.dogs.each {|dog| dog.mood = "happy"}
    end

    def feed_cats
        self.cats.each {|cat| cat.mood = "happy"}
    end

    def sell_pets
        self.dogs.each {|dog|
            dog.mood = "nervous"
            dog.owner = nil
        }
        self.cats.each {|cat| 
            cat.mood = "nervous"
            cat.owner = nil
        }
    end

    def list_pets
        dogs = self.dogs.count
        cats = self.cats.count
        return "I have #{dogs} dog#{dogs > 1 && "(s)"}, and #{cats} cat#{cats > 1 && "(s)"}."
    end
end