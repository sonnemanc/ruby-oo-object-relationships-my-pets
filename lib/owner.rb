require 'pry'
class Owner
  attr_reader :name,  :species

  @@all = []
  
  def initialize(name)
    @name = name
    @species = species
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.collect do |dog| 
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.collect do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    cats.collect do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    dogs.collect do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end


end